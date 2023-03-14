extends MarginContainer

onready var hpBar := get_node("VC/HPBar")
onready var cellDreamBar := get_node("VC/CellDreamBar")

var max_health := 100 setget set_max_health
var current_health := 0 setget set_health_and_bar


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerHealth.connect("health_changed", self , "on_Player_health_changed")
	self.max_health = PlayerHealth.max_health
	self.current_health = PlayerHealth.health


func on_Player_health_changed(new_health):
	self.current_health = new_health

#Setter function of current health
func set_health_and_bar(new_value):
	current_health = new_value
	hpBar.value = current_health

#setter function of max health
func set_max_health(new_value):
	max_health = new_value
	hpBar.max_value = max_health
