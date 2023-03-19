extends Control

onready var play_but := get_node("MC/MarginContainer/VBoxContainer/Play")
onready var quit_but := get_node("MC/MarginContainer/VBoxContainer/Quit")


# Called when the node enters the scene tree for the first time.
func _ready():
	play_but.grab_focus()


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/GameScene/GameScene.tscn")


func _on_Quit_pressed():
	get_tree().quit()
