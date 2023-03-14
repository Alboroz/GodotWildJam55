extends MarginContainer

onready var hpBar := get_node("VC/HPBar")
onready var cellDreamBar := get_node("VC/CellDreamBar")

var max_health := 100 setget set_max_health
var current_health := 0 setget set_health_and_bar

var current_dream_cells := 0 setget set_dream_cells_and_bar
var max_dream_cells := 100 setget set_max_dream_cells

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerHealth.connect("health_changed", self , "on_Player_health_changed")
	self.max_health = PlayerHealth.max_health
	self.current_health = PlayerHealth.health
	
	PlayerDreamCells.connect("dream_cells_changed" , self ,"on_Player_dream_cells_changed")
	self.current_dream_cells = PlayerDreamCells.dream_cells
	self.max_dream_cells = PlayerDreamCells.max_dream_cells

func on_Player_dream_cells_changed(new_cells):
	self.current_dream_cells = new_cells

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

#Setter function of current dream cells
func set_dream_cells_and_bar(new_value):
	current_dream_cells = new_value
	cellDreamBar.value = current_dream_cells

#setter function of max dream cells
func set_max_dream_cells(new_value):
	max_dream_cells = new_value
	cellDreamBar.max_value = max_dream_cells
