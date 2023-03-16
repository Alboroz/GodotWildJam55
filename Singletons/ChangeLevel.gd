extends Node

const levels = [
	"Level1",
	"Level2",
	"Level3",
	"Level4",
	"Level5"
	]
const dream_levels = [
	"DreamLevel1",
	"DreamLevel2",
	"DreamLevel3",
	"DreamLevel4",
	"DreamLevel5"
]

signal changed_level(level)

var game_scene: GameScene
var level_progression := 0
var dream_level_progression := 0

func _ready():
	game_scene = get_tree().current_scene
	LevelNotifier.connect("enemies_finished", self , "on_current_level_finished" )

func on_current_level_finished():
	level_progression

func go_to_dream_level():
	print("dream")

func go_to_hub_area():
	game_scene.goto_scene(game_scene.hub_area_path)

func go_to_level(level : int):
	level_progression += 1
	match level:
		1:
			LevelNotifier.enemies_left_in_level = 1
			game_scene.goto_scene(game_scene.level_1_path)
		#2: and so on
