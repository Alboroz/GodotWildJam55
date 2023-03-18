class_name Enemy
extends KinematicBody2D

const EnemyDeathEffect := preload("res://Scenes/Effects/ExplosionEffect.tscn")

onready var softCollision := get_node("SoftCollision")
onready var sprite := get_node("Sprite")
onready var playerDetection:= get_node("PlayerDetectionZone")
onready var raycast :RayCast2D = get_node("RayCast2D")
onready var anim_player := get_node("AnimationPlayer")
onready var start_scale :Vector2 = sprite.scale
onready var health := get_node("Health")
onready var blink_anim_player := get_node("BlinkAnimationPlayer")
onready var drop := get_node("Drop")
onready var hurtbox_coll_shape := get_node("Hurtbox/CollisionShape2D")
onready var cooldown_timer :Timer = get_node("Timer")

export var speed := 100.0
export var friction := 100.0
export var acceleration := 200.0

var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var knockback_vector := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	blink_anim_player.play("stop")
	health.connect("health_depleted", self , "on_health_depleted" )


func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	#look_at(point)
#	var vector = point - global_position
#	var angle = vector.angle()
#	var current_rotation = global_rotation
#	global_rotation = lerp_angle(current_rotation, angle, 0.15)
	velocity = velocity.move_toward(direction * speed, acceleration * delta)

func apply_soft_collisions(delta):
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400

func apply_knockback(delta):
	pass

func direction_from_vector(vector):
	direction = vector

func flip_enemy():
	if not is_zero_approx(velocity.x):
		sprite.scale.x = sign(velocity.x) * start_scale.x

func _on_Hurtbox_area_entered(area: Hitbox):
	health.take_damage(area.damage_dealt)
	blink_anim_player.play("start")

func on_health_depleted():
#	var enemyEffect = EnemyDeathEffect.instance()
#	get_parent().add_child(enemyEffect)
#	enemyEffect.global_position = global_position
#	drop.drop_items(global_position)
#	LevelNotifier.enemies_left_in_level -= 1
#	queue_free()
	#or
	get_node("StateMachine").transition_to("Die")
