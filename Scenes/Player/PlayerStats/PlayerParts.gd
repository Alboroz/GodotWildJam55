extends Node

signal power_up_added(new_power_up , value)

const rapid_fire := "RapidFire"
const movement_boost := "MovementBoost"
const defense_boost := "DefenseBoost"
const healt_max_boost := "HealtMaxBoost"

var rapid_fire_on :bool = false setget set_rapid_fire
var movement_boost_on: bool = false setget set_movement_boost
var defense_boost_on: bool = false setget set_defense_boost
var health_max_boost_on :bool = false setget set_health_max_boost

func _ready():
	pass
	

func set_rapid_fire(new_value):
	rapid_fire_on = new_value
	emit_signal("power_up_added", rapid_fire , rapid_fire_on)

func set_movement_boost(new_value):
	movement_boost_on = new_value
	emit_signal("power_up_added", movement_boost, movement_boost_on)

func set_defense_boost(new_value):
	defense_boost_on = new_value
	emit_signal("power_up_added", defense_boost , defense_boost_on)

func set_health_max_boost(new_value):
	health_max_boost_on = new_value
	emit_signal("power_up_added", healt_max_boost, health_max_boost_on)

func reset_power_ups():
	self.rapid_fire_on = false
	self.movement_boost_on = false
	self.defense_boost_on = false
	self.health_max_boost_on = false
