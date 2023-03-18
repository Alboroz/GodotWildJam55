extends LargeFlyingState

func physics_update(delta:float) -> void:
	var player = enemy.playerDetection.player
	if player != null:
#		enemy.accelerate_towards_point(player.global_position, delta)
		chase_target(player, delta)
		
	else:
		state_machine.transition_to("Idle")
	
	enemy.flip_enemy()
	enemy.velocity = enemy.velocity.move_toward(enemy.direction * enemy.speed , enemy.acceleration * delta)
	enemy.apply_soft_collisions(delta)
	enemy.velocity = enemy.move_and_slide(enemy.velocity)


func chase_target(player, delta):
	enemy.raycast.cast_to = player.global_position - enemy.global_position
	enemy.raycast.force_raycast_update()
	
	#if we see the player
	if !enemy.raycast.is_colliding():
		enemy.direction_from_vector(enemy.raycast.cast_to.normalized())
		#print(enemy.raycast.cast_to)
		check_player_distance()
	#if we don't see the player , we check if we can see some scent
	else:
		for scent in player.scent_trail:
			enemy.raycast.cast_to = (scent.global_position - enemy.global_position)
			enemy.raycast.force_raycast_update()
			
			if !enemy.raycast.is_colliding():
				enemy.direction_from_vector(enemy.raycast.cast_to.normalized())
				break

func check_can_shoot() -> bool:
	if not enemy.cooldown_timer.is_stopped():
		return false
	
	enemy.cooldown_timer.start(enemy.fire_rate)
	return true

func check_player_distance():
	if abs(enemy.raycast.cast_to.x) < enemy.attack_distance and abs(enemy.raycast.cast_to.y) < enemy.attack_distance:
		
		state_machine.transition_to("Attack")
