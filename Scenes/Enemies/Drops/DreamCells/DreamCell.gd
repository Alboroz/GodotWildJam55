extends Area2D

onready var anim_sprite := get_node("AnimatedSprite")
onready var collisionShape: CollisionShape2D = get_node("CollisionShape2D")

export var dream_cell_value : int = 1

# Called when the node enters the scene tree for the first time.
#func _ready():
#
#	self.connect("area_entered", self , "on_area_entered")


#when enters in contact with a collector area
func on_area_entered(area):
	queue_free()
