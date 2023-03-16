extends Area2D

onready var collisionShape := get_node("CollisionShape2D")
onready var anim_sprite := get_node("AnimatedSprite")
onready var door := get_node("Door")
onready var green_light := get_node("GreenLight")
onready var red_light := get_node("RedLight")

export var level_to_transport := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	if level_to_transport == 1:
		teleporter_open()
	else:
		teleporter_closed()


func teleporter_closed():
	collisionShape.set_deferred("disabled", true)
	green_light.visible = false
	red_light.visible = true
	anim_sprite.animation = "TeleporterClosed"
	door.play("ClosingDoor")

func teleporter_open():
	collisionShape.set_deferred("disabled", false)
	green_light.visible = true
	red_light.visible = false
	anim_sprite.animation = "TeleporterReady"
	door.play("OpeningDoor")


