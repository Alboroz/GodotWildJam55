extends Node2D

onready var current_scene = null


# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene = get_node("Level1")


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
	current_scene.free()
	
	var s = ResourceLoader.load(path)
	
	current_scene = s.instance()
	
	add_child(current_scene)
	
	#get_tree().set_current_scene(current_scene)
