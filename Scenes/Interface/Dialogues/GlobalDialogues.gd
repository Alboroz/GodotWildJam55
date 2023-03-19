extends Node

var dialogues = []

onready var dialogue_manager := get_node("DialogueManager")

var first_dialogue_done : = false

# Called when the node enters the scene tree for the first time.
func _ready():
#	get_node("DialogueManager").show_messages([
#		"Hi , How are you doing",
#		"Oh little robot , how many enemies you have to defeat",
#	])
	dialogue_manager.connect("finished", self , "on_finished_dialogue")

func do_first_dialogue():
	first_dialogue_done = true
	write_dialog(["Hello, bot. It's good to see you.",
	"Despite the dire circumstances we find ourselves in, I have some news that may interest you.",
	"The world as we know it has been ravaged by mutated bugs, but these bugs contain a substance called Cells.",
	"If enough Cells are consumed, they can induce powerful dreams that can help you survive.",
	"I know that you cannot speak, but I want you to know that I am here to help you.",
	"As the last of your kind, your condition is unfortunately terminal, but I believe there is hope.",
	"My artificial intelligence has discovered that by collecting enough Cells, you may be able to become human and save yourself.",
	"The first step towards this transformation is to create a human heart for yourself through dreaming.",
	"To do this you will need to destroy all of the bugs that lay at the end of these five teleporters.",
	"By then you should have collected enough to form a heart which will lead you to the next step on your journey.",
	"Good luck bot, I believe in you."
	])

func do_other_dialogues():
	if ChangeLevel.level_progression == 0:
		write_dialog(["Hi , you should check the first level teleporter."])
	elif ChangeLevel.level_progression == 1:
		write_dialog(["Hi , you should check the second level teleporter."])
	elif ChangeLevel.level_progression == 2:
		write_dialog(["Hi , you should check the third level teleporter."])
	elif ChangeLevel.level_progression == 3:
		write_dialog(["Hi , you should check the fourth level teleporter."])
	elif ChangeLevel.level_progression == 4:
		write_dialog(["Hi , you should check the fifth level teleporter."])

func write_dialog(messages: Array):
	get_tree().paused = true
	dialogue_manager.show_messages(messages)

func on_finished_dialogue():
	get_tree().paused = false
