extends Area2D

onready var collisionShape := get_node("CollisionShape2D")
onready var anim_sprite := get_node("AnimatedSprite")
onready var door := get_node("Door")
onready var green_light := get_node("GreenLight")
onready var red_light := get_node("RedLight")
onready var tooltip := get_node("Tooltip")

export var level_to_transport := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	check_teleporter()

func check_teleporter():
	if ChangeLevel.level_progression == 0:
		if level_to_transport == 1:
			teleporter_open()
		else:
			teleporter_closed()
	elif ChangeLevel.level_progression == 1:
		if level_to_transport == 2:
			teleporter_open()
		else:
			teleporter_closed()
	elif ChangeLevel.level_progression == 2:
		if level_to_transport == 3:
			teleporter_open()
		else:
			teleporter_closed()
	elif ChangeLevel.level_progression == 3:
		if level_to_transport == 4:
			teleporter_open()
		else:
			teleporter_closed()
	elif ChangeLevel.level_progression == 4:
		if level_to_transport == 5:
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


func _on_TeleporterHub_body_entered(body: Player):
	tooltip.visible = true
	body.on_player_entered_teleporter_hub_area(level_to_transport)

func _on_TeleporterHub_body_exited(body: Player):
	tooltip.visible = false
	body.on_player_exited_teleporter_hub_area()
