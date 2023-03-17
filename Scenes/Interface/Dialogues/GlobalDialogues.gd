extends Node

var dialogues = []

onready var dialogue_manager := get_node("DialogueManager")

# Called when the node enters the scene tree for the first time.
func _ready():
#	get_node("DialogueManager").show_messages([
#		"Hi , How are you doing",
#		"Oh little robot , how many enemies you have to defeat",
#	])
	dialogue_manager.connect("finished", self , "on_finished_dialogue")

func write_dialog(messages: Array):
	get_tree().paused = true
	dialogue_manager.show_messages(messages)

func on_finished_dialogue():
	get_tree().paused = false
