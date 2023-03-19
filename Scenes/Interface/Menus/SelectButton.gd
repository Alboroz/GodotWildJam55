extends TextureButton

export (int) var margin_from_center = 20

onready var select_arrow := get_node("SelectArrow")

# Called when the node enters the scene tree for the first time.
func _ready():
	#show_arrows()
	hide_arrow()

func hide_arrow():
	select_arrow.visible = false

func show_arrow():
	select_arrow.visible = true

func show_arrows():
	select_arrow.visible = true
	select_arrow.global_position.y = rect_global_position .y + (rect_size.y / 3.0)
	
	var center_x = rect_global_position.x
	select_arrow.global_position.x = center_x - margin_from_center

func _on_SelectButton_focus_entered():
	show_arrow()

func _on_SelectButton_focus_exited():
	hide_arrow()

func _on_SelectButton_mouse_entered():
	grab_focus()
