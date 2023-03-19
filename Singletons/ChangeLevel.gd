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
var is_in_hub_area := true
var level_progression := 0

func _ready():
	game_scene = get_tree().current_scene
	LevelNotifier.connect("enemies_finished", self , "on_current_level_finished" )

func on_current_level_finished():
	level_progression

func reset():
	level_progression = 0
	is_in_hub_area = false

func game_restart():
	game_scene.restart_current_scene()
	PlayerDreamCells.reset_dream_cells()
	PlayerHealth.reset_health()
	PlayerParts.reset_power_ups()
	GlobalDialogues.first_dialogue_done = false
	match level_progression:
		1:
			LevelNotifier.enemies_left_in_level = 4
		2:
			LevelNotifier.enemies_left_in_level = 19
		3:
			LevelNotifier.enemies_left_in_level = 24
		4:
			LevelNotifier.enemies_left_in_level = 31
		5:
			LevelNotifier.enemies_left_in_level = 27


func go_to_hub_area():
	is_in_hub_area = true
	game_scene.goto_scene(game_scene.hub_area_path)

func go_to_level(level : int):
	level_progression += 1
	is_in_hub_area = false
	#When we go to the level we update the enemies left variable and then go to that level
	
	match level:
		1:
			LevelNotifier.enemies_left_in_level = 4
			game_scene.goto_scene(game_scene.level_1_path)
		2:
			LevelNotifier.enemies_left_in_level = 19
			game_scene.goto_scene(game_scene.level_2_path)
		3:
			LevelNotifier.enemies_left_in_level = 24
			game_scene.goto_scene(game_scene.level_3_path)
		4:
			LevelNotifier.enemies_left_in_level = 31
			game_scene.goto_scene(game_scene.level_4_path)
		5:
			LevelNotifier.enemies_left_in_level = 27
			game_scene.goto_scene(game_scene.level_5_path)
