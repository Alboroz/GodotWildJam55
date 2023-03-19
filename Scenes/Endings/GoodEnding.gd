extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("DeathNum").text = str(ChangeLevel.player_deaths)

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().change_scene("res://Scenes/Interface/Menus/MainMenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
