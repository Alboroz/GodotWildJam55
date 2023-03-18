extends Node

const levels = [
	"Level1",
	"Level2",
	"Level3",
	"Level4",
	"Level5"
	]

signal changed_level(level)

var game_scene: GameScene = null
var is_in_hub_area := false
var level_progression := 1

func _ready():
	game_scene = get_tree().current_scene
	LevelNotifier.connect("enemies_finished", self , "on_current_level_finished" )

func on_current_level_finished():
	level_progression

func game_restart():
	game_scene.restart_current_scene()
	PlayerDreamCells.reset_dream_cells()
	PlayerHealth.reset_health()
	match level_progression:
		1:
			LevelNotifier.enemies_left_in_level = 1
		2:
			LevelNotifier.enemies_left_in_level = 2
		3:
			LevelNotifier.enemies_left_in_level = 3
		4:
			LevelNotifier.enemies_left_in_level = 4
		5:
			LevelNotifier.enemies_left_in_level = 5


func go_to_hub_area():
	is_in_hub_area = true
	game_scene.goto_scene(game_scene.hub_area_path)

func go_to_level(level : int):
	level_progression += 1
	is_in_hub_area = false
	#When we go to the level we update the enemies left variable and then go to that level
	match level:
		1:
			LevelNotifier.enemies_left_in_level = 1
			game_scene.goto_scene(game_scene.level_1_path)
		#2: and so on
