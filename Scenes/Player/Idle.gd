extends PlayerState

func physics_update(delta:float) -> void:
	#Option 1:
	#player.velocity = lerp(player.velocity, Vector2.ZERO , player.accelerationa * delta )
	#Option 2:
	player.velocity += (Vector2.ZERO - player.velocity) * player.friction
	player.velocity = player.move_and_slide(player.velocity)
	
	#to change state
	if not is_zero_approx(player.get_input_direction().x) or not is_zero_approx(player.get_input_direction().y):
		state_machine.transition_to("Walk")
