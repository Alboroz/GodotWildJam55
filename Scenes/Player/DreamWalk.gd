extends PlayerState


func enter(msg := {}):
	player.animationState.travel("DreamWalk")
	AudioManager.play_sound(AudioManager.footsteps_string)

func physics_update(delta:float) -> void:
	
	#if player pressed the move buttons
	if not is_zero_approx(player.get_input_direction().x) or not is_zero_approx(player.get_input_direction().y):
		var target_velocity = player.dream_speed * player.get_input_direction()
		player.velocity += (target_velocity - player.velocity) * player.friction
		#or we can use this one but the first is better
		#player.velocity = lerp(player.velocity, player.get_input_direction()* player.speed, player.acceleration * delta)
	
	player.velocity = player.move_and_slide(player.velocity)
	
	
	#to change state
	if is_zero_approx(player.get_input_direction().x) and is_zero_approx(player.get_input_direction().y):
		state_machine.transition_to("DreamIdle")
