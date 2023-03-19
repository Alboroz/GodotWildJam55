extends Area2D



func _on_Collector_area_entered(area : Area2D):
	if area.is_in_group("DreamCells"):
		PlayerDreamCells.take_dream_cell(area.dream_cell_value)
		AudioManager.play_sound(AudioManager.drop_pickup_string)
	elif area.is_in_group("PowerUp"):
		match area.type:
			PlayerParts.rapid_fire:
				PlayerParts.rapid_fire_on = true
			PlayerParts.movement_boost:
				PlayerParts.movement_boost_on = true
			PlayerParts.defense_boost:
				PlayerParts.defense_boost_on = true
			PlayerParts.healt_max_boost:
				PlayerParts.health_max_boost_on = true
		AudioManager.play_sound(AudioManager.power_up_string)
	elif area.is_in_group("HealthHeal"):
		PlayerHealth.heal(area.heal_value)
		AudioManager.play_sound(AudioManager.drop_pickup_string)
	area.queue_free()
