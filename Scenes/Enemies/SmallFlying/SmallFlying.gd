extends Enemy
class_name SmallFlying

const EnemyBulletScene := preload("res://Scenes/Enemies/Bullets/EnemyBullet1.tscn")

onready var pos_fire := get_node("Sprite/Position2D")

export var attack_distance : float = 100.0
export var fire_rate: = 0.4


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_Death_animation_finished():
	drop.drop_items(global_position)
	LevelNotifier.enemies_left_in_level -= 1
	queue_free()
