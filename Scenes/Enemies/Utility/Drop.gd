extends Node

const dream_cell1 = preload("res://Scenes/Enemies/Drops/DreamCells/DreamCell1.tscn")
const dream_cell2 = preload("res://Scenes/Enemies/Drops/DreamCells/DreamCell2.tscn")
const dream_cell3 = preload("res://Scenes/Enemies/Drops/DreamCells/DreamCell3.tscn")

var drop_randomizer := RandomNumberGenerator.new()
var cell_to_drop : PackedScene = null

# the value of the distribution of every item needs to be from 0 to 10000
var drops_rarity_distribution = {
	"DreamCells": {
		"DreamCell1": 50,
		"DreamCell2": 30,
		"DreamCell3": 20
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	drop_randomizer.randomize()
	var drop_percentage = drop_randomizer.randi_range(0, 100)
	
	if drop_percentage >= 0 and drop_percentage < 50:
		cell_to_drop = dream_cell1
	elif drop_percentage >= 50 and drop_percentage < 80:
		cell_to_drop = dream_cell2
	elif drop_percentage >= 80:
		cell_to_drop = dream_cell3
	


func drop_items(position):
	var cell = cell_to_drop.instance()
	get_tree().current_scene.get_node("Drops").add_child(cell)
	cell.global_position = position
	
