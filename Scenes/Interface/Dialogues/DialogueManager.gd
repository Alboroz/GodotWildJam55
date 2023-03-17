extends Node
class_name DialogueManager

const DIALOGUE_SCENE := preload("res://Scenes/Interface/Dialogues/Dialogue.tscn")

onready var canvas := get_node("Canvas")

signal message_completed()
signal finished()

var messages := []
var is_active := false
var active_dialogue_offset := 0
var curr_dialogue_ins : Dialogue


func show_messages(message_list : Array):
	if is_active:
		return
	is_active = true
	messages = message_list
	
	var dialogue = DIALOGUE_SCENE.instance()
	dialogue.connect("message_completed", self , "on_message_completed" )
	canvas.add_child(dialogue)
	curr_dialogue_ins = dialogue
	show_current()

func show_current():
	var msg := messages[active_dialogue_offset] as String
	curr_dialogue_ins.update_message(msg)

func _input(event):
	if (
		event.is_pressed() and         
		!event.is_echo() and
		event is InputEventKey and (
		event as InputEventKey).scancode == KEY_ENTER and
		is_active and
		curr_dialogue_ins.message_is_fully_visible()
	):
		if active_dialogue_offset < messages.size() - 1:
			active_dialogue_offset += 1
			show_current()
		else:
			hide()

func hide():
	curr_dialogue_ins.disconnect(
		"message_completed", 
		self, 
		"_on_message_completed"
	)
	curr_dialogue_ins.queue_free()
	curr_dialogue_ins = null
	is_active = false
	emit_signal("finished")

func on_message_completed():
	pass

