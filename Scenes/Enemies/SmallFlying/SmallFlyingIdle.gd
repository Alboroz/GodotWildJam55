extends SmallFlyingState

func enter(msg := {}):
	enemy.anim_player.play("SmallFlyingIdle")
	enemy.velocity = Vector2.ZERO

func physics_update(delta:float) -> void:
	enemy.velocity = enemy.velocity.move_toward(Vector2.ZERO, enemy.friction * delta)
	seek_player()
	enemy.flip_enemy()
	enemy.apply_soft_collisions(delta)
	enemy.velocity = enemy.move_and_slide(enemy.velocity)

func check_can_shoot() -> bool:
	if not enemy.cooldown_timer.is_stopped():
		return false
	
	enemy.cooldown_timer.start(enemy.fire_rate)
	return true

func seek_player():
	if enemy.playerDetection.can_see_player() and check_can_shoot():
		state_machine.transition_to("Chase")
