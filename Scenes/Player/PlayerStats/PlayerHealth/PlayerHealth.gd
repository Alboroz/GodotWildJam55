extends "res://Scenes/Stats/Health.gd"

signal max_health_changed(new_value)

func reset_health():
	health = max_health
	emit_signal("health_changed", health)
	
