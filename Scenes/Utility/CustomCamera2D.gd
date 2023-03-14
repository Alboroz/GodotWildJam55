extends Camera2D

onready var player := get_parent()

#offset amount should be from 0.1 to 0.25
export var offset_amount := 0.2
export var smooth_lean := 10.0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#offset = (get_global_mouse_position() - player.global_position ) * offset_amount
	offset = lerp(offset, (get_global_mouse_position() - player.global_position) * offset_amount, smooth_lean * delta)

