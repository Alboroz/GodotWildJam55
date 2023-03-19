extends WormState


func enter(msg := {}):
	enemy.hurtbox_coll_shape.set_deferred("disabled", true)
	enemy.anim_player.play("worm_die")


