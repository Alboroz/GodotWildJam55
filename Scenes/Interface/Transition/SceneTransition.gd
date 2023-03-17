extends CanvasLayer

onready var anim_sprite := get_node("AnimatedSprite")

func play_transition(backwards: bool):
	anim_sprite.play("transition", backwards)

