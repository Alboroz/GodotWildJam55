extends MarginContainer
class_name Dialogue

signal message_completed()

onready var type_timer := get_node("TypeTimer")
onready var text := get_node("NinePatchRect/Text")
onready var anim_player := get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player.play("Stop")
	type_timer.connect("timeout", self , "on_type_timer_timeout" )
	

func message_is_fully_visible() -> bool:
	return text.visible_characters == text.text.length()

func update_message( message :String):
	anim_player.play("Stop")
	text.text = message
	text.visible_characters = 0
	type_timer.start()

func on_type_timer_timeout():
	if text.visible_characters < text.text.length():
		text.visible_characters += 1
	else:
		type_timer.stop()
		emit_signal("message_completed")
		anim_player.play("Start")
		
