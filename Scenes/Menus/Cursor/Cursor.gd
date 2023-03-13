extends Node2D

onready var sprite = get_node("Sprite")


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position = Vector2(floor(get_viewport().get_mouse_position().x / 3) * 3, floor(get_viewport().get_mouse_position().y / 3) * 3)
	position = get_global_mouse_position()
