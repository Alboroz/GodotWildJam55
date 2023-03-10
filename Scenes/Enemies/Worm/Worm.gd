class_name Worm
extends KinematicBody2D

onready var sprite_collisions := get_node("SpritesAndCollisions")
onready var playerDetection:= get_node("PlayerDetectionZone")
onready var softCollision := get_node("SoftCollision")
onready var raycast :RayCast2D = get_node("RayCast2D")
onready var start_scale :Vector2 = sprite_collisions.scale

export var speed := 100.0
export var friction := 100.0
export var acceleration := 200.0

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	#look_at(point)
#	var vector = point - global_position
#	var angle = vector.angle()
#	var current_rotation = global_rotation
#	global_rotation = lerp_angle(current_rotation, angle, 0.15)
	velocity = velocity.move_toward(direction * speed, acceleration * delta)

func direction_from_vector(vector):
	direction = vector
	#draw_line(Vector2.ZERO, vector, Color.green)

func apply_soft_collisions(delta):
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400



func flip_enemy():
	if not is_zero_approx(velocity.x):
		sprite_collisions.scale.x = -sign(velocity.x) * start_scale.x
