extends Area2D

onready var tooltip := get_node("Tooltip")
onready var collisionShape := get_node("CollisionShape2D")

var no_more_enemies :bool = false
var dream_cell_full :bool = false

func _ready():
	self.visible = false
	collisionShape.set_deferred("disabled", true)
	LevelNotifier.connect("enemies_finished", self , "on_enemies_finished")
	PlayerDreamCells.connect("max_dream_cells_reached", self , "on_max_dream_cells_reached")
	
	if LevelNotifier.enemies_left_in_level!= 0:
		no_more_enemies = false
	if PlayerDreamCells.dream_cells == PlayerDreamCells.max_dream_cells:
		dream_cell_full = true
	else:
		dream_cell_full = false
	

func set_dream_portal_interactable():
	self.visible = true
	collisionShape.set_deferred("disabled", false)

func on_max_dream_cells_reached():
	dream_cell_full = true
	if no_more_enemies:
		set_dream_portal_interactable()

func on_enemies_finished():
	no_more_enemies = true
	if dream_cell_full:
		set_dream_portal_interactable()

func _on_DreamPortal_body_entered(body: Player):
	body.on_player_entered_dream_portal_area()
	tooltip.visible = true


func _on_DreamPortal_body_exited(body: Player):
	body.on_player_exited_dream_portal_area()
	tooltip.visible = false
