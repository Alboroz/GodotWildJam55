extends PlayerState


func enter(msg := {}):
	AudioManager.stop_sound(AudioManager.footsteps_string)
	player.animationState.travel("Die")

