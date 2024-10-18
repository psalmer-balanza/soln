extends Node

@export var initial_state : State

var current_state : State
var states : Dictionary = {}
var player: CharacterBody2D

func _ready():
	for child in get_children():
		# state.tscn script extends node so we can directly check whether its a state or not
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

# Set the player reference for the state machine
func set_player(player_ref: CharacterBody2D):
	player = player_ref
	for state in states.values():
		state.player = player  # Pass the player to each state

func _process(delta):
	if current_state:
		current_state.Update(delta)
		
func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)
		
func on_child_transition(state, new_state_name):
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
		
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	current_state = new_state
