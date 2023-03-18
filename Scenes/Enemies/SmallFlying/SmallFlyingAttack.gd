extends SmallFlyingState

var direction_of_bullet := Vector2.ZERO

func enter(msg := {}):
	enemy.anim_player.play("SmallFlyingAttack")
	direction_of_bullet = enemy.raycast.cast_to.normalized()

func physics_update(delta:float) -> void:
	var player = enemy.playerDetection.player
	if player != null:
		lock_target(player)

func lock_target(player):
	enemy.raycast.cast_to = player.global_position - enemy.global_position
	enemy.raycast.force_raycast_update()
	
	if !enemy.raycast.is_colliding():
		direction_of_bullet = enemy.raycast.cast_to.normalized()
		enemy.sprite.scale.x = sign(direction_of_bullet.x) * enemy.start_scale.x


func fire_bullet():
	var bullet_instance = enemy.EnemyBulletScene.instance()
	bullet_instance.global_position = enemy.pos_fire.global_position
	bullet_instance.direction = direction_of_bullet
	add_child(bullet_instance)

func attack_animation_finished():
	state_machine.transition_to("Idle")
