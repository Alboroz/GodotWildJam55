extends Area2D

onready var collisionShape := get_node("CollisionShape2D")
onready var anim_sprite := get_node("AnimatedSprite")
onready var door := get_node("Door")
onready var green_light := get_node("GreenLight")
onready var red_light := get_node("RedLight")

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelNotifier.connect("enemies_finished", self , "on_enemies_finished")
	teleporter_closed()

func on_enemies_finished():
	teleporter_open()

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


func _on_Teleporter_body_entered(body: Player):
	body.on_player_entered_teleporter_area()

func _on_Teleporter_body_exited(body: Player):
	body.on_player_exited_teleporter_area()
