extends WormState

func enter(msg := {}):
	enemy.anim_player.play("worm_idle")

func physics_update(delta:float) -> void:
	enemy.velocity = enemy.velocity.move_toward(Vector2.ZERO, enemy.friction * delta)
	seek_player()
	enemy.flip_enemy()
	enemy.apply_soft_collisions(delta)
	enemy.velocity = enemy.move_and_slide(enemy.velocity)

func seek_player():
	if enemy.playerDetection.can_see_player():
		state_machine.transition_to("Chase")
