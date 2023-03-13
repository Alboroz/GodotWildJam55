class_name Player
extends KinematicBody2D

onready var debugLabel = get_node("Debug")
onready var anim_player = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

export var speed := 300.0
export var friction := 0.18
export var acceleration := 20.0

var facing_forward = true
var facing_right = false

var velocity := Vector2.ZERO

func _ready():
	animationTree.active = true

func get_input_direction() -> Vector2:
	var input_vector := Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	)
	
#	if facing_right and velocity.x > 0:
#		flip()
#	if !facing_right and velocity.x < 0:
#		flip()

	var move_direction := input_vector.normalized()
	
	if move_direction != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", move_direction)
		animationTree.set("parameters/Walk/blend_position", move_direction)
	return move_direction

func _physics_process(delta):
	#Just for debug
	#print(velocity)
	pass

func _on_StateMachine_transitioned(state_name):
	debugLabel.text = state_name

func flip():
	facing_right = !facing_right
	#sprite.flip_h = !sprite.flip_h
