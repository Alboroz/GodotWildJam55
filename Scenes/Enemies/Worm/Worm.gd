class_name Worm
extends KinematicBody2D

onready var playerDetection:= get_node("PlayerDetectionZone")

export var speed := 100.0
export var friction := 100.0
export var acceleration := 200.0

var velocity := Vector2.ZERO

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * speed, acceleration * delta)
	#sprite.flip_h = velocity.x < 0
