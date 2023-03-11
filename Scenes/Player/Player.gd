class_name Player
extends KinematicBody2D

onready var debugLabel = get_node("Debug")

export var speed := 300.0
export var friction := 0.18
export var acceleration := 20.0

var velocity := Vector2.ZERO

func get_input_direction() -> Vector2:
	var input_vector := Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	)
	
	var move_direction := input_vector.normalized()
	return move_direction

func _physics_process(delta):
	#Just for debug
	print(velocity)

func _on_StateMachine_transitioned(state_name):
	debugLabel.text = state_name
