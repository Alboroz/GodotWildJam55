class_name Hurtbox
extends Area2D

const HitEffect = null

onready var collisionShape := get_node("CollisionShape2D")

#func _ready():
#	connect("area_entered",self , "on_area_entered")
#
#func on_area_entered(area: Hitbox):
#	print(area)

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position
