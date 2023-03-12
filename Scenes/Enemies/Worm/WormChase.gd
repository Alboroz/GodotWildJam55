extends WormState


func physics_update(delta:float) -> void:
	var player = enemy.playerDetection.player
	if player != null:
		enemy.accelerate_towards_point(player.global_position, delta)
	else:
		state_machine.transition_to("Idle")
	
	enemy.velocity = enemy.move_and_slide(enemy.velocity)
