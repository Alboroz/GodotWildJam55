extends MarginContainer

onready var rapid_fire := get_node("VC/RapidFire")
onready var move_boost := get_node("VC/MovementBoost")
onready var defense_boost := get_node("VC/DefenseBoost")
onready var health_max_boost := get_node("VC/HealthMaxBoost")


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerParts.connect("power_up_added", self, "on_power_up_changed")

func on_power_up_changed(new_power_up , value):
	print(new_power_up)
	match new_power_up:
		PlayerParts.rapid_fire:
			if value:
				rapid_fire.visible = true
			else:
				rapid_fire.visible = false
		PlayerParts.movement_boost:
			if value:
				move_boost.visible = true
			else:
				move_boost.visible = false
		PlayerParts.defense_boost:
			defense_boost.visible = value
		PlayerParts.healt_max_boost:
			health_max_boost.visible = value
