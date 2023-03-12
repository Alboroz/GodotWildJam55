extends WormState

func enter(msg := {}):
	pass

func physics_update(delta:float) -> void:
	enemy.velocity = enemy.velocity.move_toward(Vector2.ZERO, enemy.friction * delta)
	seek_player()
	enemy.velocity = enemy.move_and_slide(enemy.velocity)

func seek_player():
	if enemy.playerDetection.can_see_player():
		state_machine.transition_to("Chase")
