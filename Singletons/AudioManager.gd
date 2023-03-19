extends Node

const power_up_string := "PowerUp"
const menu_string := "MenuSound"
const shoot_string := "Shoot"
const teleporter_string := "Teleporter"
const hit_string := "Hit"
const drop_pickup_string := "Drop"
const footsteps_string := "Footsteps"

onready var footsteps := get_node("footsteps")
onready var shoot := get_node("shoot")
onready var teleporter := get_node("teleporter")
onready var menu := get_node("menu")
onready var drop_pickup := get_node("drop_pickup")
onready var power_up := get_node("power_up")
onready var hit := get_node("hit")

var music_on := true setget set_music_on
var sound_on := true setget set_sound_on


func set_music_on(value):
	music_on = value
	if music_on:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"),false)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"),true)


func set_sound_on(value):
	sound_on = value
	if sound_on:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"),false)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sounds"), true)

func play_sound(sound: String):
	match sound:
		power_up_string:
			power_up.play()
		menu_string:
			menu.play()
		shoot_string:
			shoot.play()
		teleporter_string:
			teleporter.play()
		drop_pickup_string:
			drop_pickup.play()
		footsteps_string:
			footsteps.play()

func stop_sound(sound: String):
	match sound:
		footsteps_string:
			footsteps.stop()

