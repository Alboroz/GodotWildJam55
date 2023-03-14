extends AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("animation_finished", self , "on_animation_finished")
	play("play")

func on_animation_finished():
	queue_free()
