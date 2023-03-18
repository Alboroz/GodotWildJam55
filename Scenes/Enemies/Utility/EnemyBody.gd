extends Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func on_anim_finished():
	queue_free()
