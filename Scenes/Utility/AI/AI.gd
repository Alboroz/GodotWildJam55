extends Area2D


onready var anim_sprite := get_node("AnimatedSprite")
onready var tooltip := get_node("Tooltip")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_AI_body_entered(body: Player):
	tooltip.visible = true
	body.is_in_dialogue_area = true


func _on_AI_body_exited(body: Player):
	tooltip.visible = false
	body.is_in_dialogue_area = false
