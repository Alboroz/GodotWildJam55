extends Hurtbox

onready var timer := get_node("Timer")

signal invincibility_started
signal invincibility_ended

var invincible = false setget set_invincible

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func _on_Timer_timeout():
	self.invincible = false

func _on_PlayerHurtbox_invincibility_started():
	collisionShape.set_deferred("disabled", true)

func _on_PlayerHurtbox_invincibility_ended():
	collisionShape.disabled = false
