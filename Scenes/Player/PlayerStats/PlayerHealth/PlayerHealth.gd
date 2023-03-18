extends "res://Scenes/Stats/Health.gd"

func reset_health():
	health = max_health
	emit_signal("health_changed", health)
	
