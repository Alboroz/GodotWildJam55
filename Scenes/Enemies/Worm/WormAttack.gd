extends WormState

var charge_done := false
var one_time_done := false
var direction_of_attack := Vector2.ZERO

func enter(msg := {}):
	enemy.anim_player.play("worm_charge")
	charge_done = false
	direction_of_attack = enemy.raycast.cast_to.normalized()

func physics_update(delta:float) -> void:
	if charge_done:
#		if !one_time_done:
#			enemy.velocity += direction_of_attack * enemy.attack_charge_speed * delta
#			one_time_done = true
		enemy.velocity = enemy.velocity.move_toward(direction_of_attack * enemy.attack_charge_speed , enemy.acceleration * delta)
		
		enemy.velocity = enemy.move_and_slide(enemy.velocity)


func charge_finished():
	charge_done = true
	enemy.anim_player.play("worm_attack")

func attack_animation_finished():
	state_machine.transition_to("Chase")
