extends Node

signal enemies_finished()

var enemies_left_in_level := 1 setget set_enemies_left

func _ready():
	pass

func set_enemies_left(value):
	enemies_left_in_level = value
	if enemies_left_in_level == 0:
		if ChangeLevel.level_progression == 1:
			PlayerParts.rapid_fire_on = true
		elif ChangeLevel.level_progression == 2:
			PlayerParts.movement_boost_on = true
		elif ChangeLevel.level_progression == 3:
			PlayerParts.defense_boost_on = true
		elif ChangeLevel.level_progression == 4:
			PlayerParts.health_max_boost_on = true
		elif ChangeLevel.level_progression == 5:
			ChangeLevel.finish_game()
		emit_signal("enemies_finished")


