extends Popup

onready var continue_but := get_node("Panel/MC/VBC/VBC/Continue")
onready var music_but := get_node("Panel/MC/VBC/VBC/Music")
onready var sound_but := get_node("Panel/MC/VBC/VBC/Sound")
onready var main_menu := get_node("Panel/MC/VBC/VBC/MainMenu")

# Called when the node enters the scene tree for the first time.
func _ready():
	continue_but.grab_focus()
	set_audio_but()
	set_sound_but()

func _on_PauseMenu_about_to_show():
	get_tree().paused = true

func _on_PauseMenu_popup_hide():
	get_tree().paused = false

func _on_Continue_pressed():
	hide()

func set_audio_but():
	if AudioManager.music_on:
		music_but.get_node("Music_on").visible = true
		music_but.get_node("Music_off").visible = false
	else:
		music_but.get_node("Music_on").visible = false
		music_but.get_node("Music_off").visible = true

func _on_Music_pressed():
	AudioManager.music_on = !AudioManager.music_on
	set_audio_but()

func set_sound_but():
	if AudioManager.sound_on:
		sound_but.get_node("Sound_on").visible = true
		sound_but.get_node("Sound_off").visible = false
	else:
		sound_but.get_node("Sound_on").visible = false
		sound_but.get_node("Sound_off").visible = true

func _on_Sound_pressed():
	AudioManager.sound_on = !AudioManager.sound_on
	set_sound_but()

func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/Interface/Menus/MainMenu.tscn")
