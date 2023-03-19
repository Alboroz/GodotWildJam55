extends Node2D
class_name GameScene

const hub_area_path = "res://Scenes/Levels/LevelHub.tscn"
const level_1_path = "res://Scenes/Levels/Level1.tscn"
const level_2_path = "res://Scenes/Levels/Level2.tscn"
const level_3_path = "res://Scenes/Levels/Level3.tscn"
const level_4_path = "res://Scenes/Levels/Level4.tscn"
const level_5_path = "res://Scenes/Levels/Level5.tscn"

const dream_level_1_path = ""

onready var scene_transition := get_node("SceneTransition")

var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	#current_scene = get_node("Level1")
	load_current_scene()
	PlayerDreamCells.reset_dream_cells()
	PlayerHealth.reset_health()

func get_current_scene():
	if ChangeLevel.is_in_hub_area:
		pass
	else:
		var selected_level = ChangeLevel.level_progression # -1
		var scene = get_node(ChangeLevel.levels[selected_level])

func load_current_scene():
	var scene = null
	if ChangeLevel.is_in_hub_area:
		scene = preload(hub_area_path)
	else:
		var selected_level = ChangeLevel.level_progression  -1
		scene = load("res://Scenes/Levels/"+ ChangeLevel.levels[selected_level] +".tscn")
	
	current_scene = scene.instance()
	add_child(current_scene)

func restart_current_scene():
	current_scene.queue_free()
	load_current_scene()


func going_to_ending():
	get_node("Interface").visible = false

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_node("Interface/PauseMenu").popup()

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.
	
	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	#Add transition here
	scene_transition.play_transition(false)
	yield(scene_transition.get_node("AnimatedSprite"),"animation_finished")
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	add_child(current_scene)
	
	scene_transition.play_transition(true)
	yield(scene_transition.get_node("AnimatedSprite"),"animation_finished")
	
	#get_tree().set_current_scene(current_scene)


func _on_GameScene_tree_entered():
	ChangeLevel.game_scene = self
