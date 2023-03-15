class_name Bullet
extends Hitbox

onready var timer := get_node("Timer")

export var speed := 300.0
export var lifetime := 5.0

var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	#look_at(position + direction)
	
	timer.connect("timeout", self , "queue_free")
	timer.start(lifetime)
	self.connect("body_entered", self , "on_world_impact")
	self.connect("area_entered", self , "on_impact")

func _physics_process(delta):
	position += direction * speed * delta

func on_impact(area: Area2D):
	queue_free()

func on_world_impact(body: Node):
	queue_free()
