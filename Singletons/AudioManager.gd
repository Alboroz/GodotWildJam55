extends Node


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
