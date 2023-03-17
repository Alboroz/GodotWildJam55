class_name SmallFlying
extends KinematicBody2D

const EnemyDeathEffect := preload("res://Scenes/Effects/ExplosionEffect.tscn")



export var speed := 100.0
export var friction := 100.0
export var acceleration := 200.0
export var attack_charge_speed := 300.0

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
