class_name Worm
extends KinematicBody2D

onready var playerDetection:= get_node("PlayerDetectionZone")
onready var softCollision := get_node("SoftCollision")

export var speed := 100.0
export var friction := 100.0
export var acceleration := 200.0

var velocity := Vector2.ZERO

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	#look_at(point)
	var vector = point - global_position
	var angle = vector.angle()
	var current_rotation = global_rotation
	global_rotation = lerp_angle(current_rotation, angle, 0.15)
	velocity = velocity.move_toward(direction * speed, acceleration * delta)
	#sprite.flip_h = velocity.x < 0

func apply_soft_collisions(delta):
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400
