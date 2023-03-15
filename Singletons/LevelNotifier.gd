extends Node

signal enemies_finished()

var enemies_left_in_level := 1 setget set_enemies_left

func _ready():
	pass

func set_enemies_left(value):
	enemies_left_in_level = value
	if enemies_left_in_level == 0:
		emit_signal("enemies_finished")

