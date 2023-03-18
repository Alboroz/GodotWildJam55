extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	connect("animation_finished", self , "on_animation_finished")
	play("play")


func on_animation_finished():
	queue_free()
