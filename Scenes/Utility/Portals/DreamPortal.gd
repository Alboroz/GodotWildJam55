extends Area2D


onready var tooltip := get_node("Tooltip")



func _on_DreamPortal_body_entered(body: Player):
	body.on_player_entered_dream_portal_area()
	tooltip.visible = true


func _on_DreamPortal_body_exited(body: Player):
	body.on_player_exited_dream_portal_area()
	tooltip.visible = false
