class_name Player
extends KinematicBody2D

const scent_scene = preload("res://Scenes/Player/PlayerUtilities/Scent.tscn")
const bullet_scene = preload("res://Scenes/Player/PlayerUtilities/PlayerBullet.tscn")

onready var debugLabel = get_node("Debug")
onready var arm = get_node("Arm")
onready var arm2 = get_node("Arm2")
onready var shoot_pos = get_node("Arm/ShootPos")
onready var shoot_pos2 = get_node("Arm2/ShootPos2")
onready var sprite = get_node("Sprite")
onready var hurtbox = get_node("PlayerHurtbox")
onready var anim_player = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var start_scale :Vector2 = sprite.scale

export var speed := 300.0
export var friction := 0.18
export var acceleration := 20.0

var facing_right: bool = true
var velocity := Vector2.ZERO
var scent_trail = []

func _ready():
	animationTree.active = true
	$ScentTrailTimer.connect("timeout", self , "add_scent")
	hurtbox.connect("area_entered", self, "on_hurtbox_area_entered")

func get_input_direction() -> Vector2:
	var input_vector := Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	)
	
	var move_direction := input_vector.normalized()
	
#	if move_direction != Vector2.ZERO:
#		animationTree.set("parameters/Idle/blend_position", move_direction)
#		animationTree.set("parameters/Walk/blend_position", move_direction)
	return move_direction

func _physics_process(delta):
	#Just for debug
	#print(velocity)
	arm.look_at(get_global_mouse_position())
	arm2.look_at(get_global_mouse_position())
	if get_viewport().get_mouse_position().x >= 240.0:
		arm.visible = true
		arm2.visible = false
		facing_right = true
		animationTree.set("parameters/Idle/blend_position", Vector2(1,0))
		animationTree.set("parameters/Walk/blend_position", Vector2(1,0))
	else:
		arm.visible = false
		arm2.visible = true
		facing_right = false
		animationTree.set("parameters/Idle/blend_position", Vector2(-1,0))
		animationTree.set("parameters/Walk/blend_position", Vector2(-1,0))
	#print(get_viewport().get_mouse_position())
	

func on_hurtbox_area_entered(area: Hitbox):
	PlayerHealth.take_damage(area.damage_dealt)
	hurtbox.start_invincibility(0.6)

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("shoot"):
		shoot(bullet_scene)

func shoot(bullet: PackedScene):
	var bullet_instance := bullet.instance()
	if facing_right:
		bullet_instance.position = shoot_pos.global_position
	else:
		bullet_instance.position = shoot_pos2.global_position
	bullet_instance.direction = global_position.direction_to(get_global_mouse_position())
	add_child(bullet_instance)

func add_scent():
	var scent      = scent_scene.instance()
	scent.player   = self
	scent.position = self.position
	
	get_tree().current_scene.get_node("Effects").add_child(scent)
	scent_trail.push_front(scent)

func _on_StateMachine_transitioned(state_name):
	debugLabel.text = state_name

