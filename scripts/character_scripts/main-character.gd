# Player.gd
extends CharacterBody2D

var movement_speed : float = 150.0
var character_direction : Vector2

# Use the state machine
@onready var state_machine: Node = $StateMachine  # Assuming the state machine is a child of the player

@onready var actionable_finder: Area2D = $ActionableFinder

func _ready():
	# Pass the player (self) to the state machine
	state_machine.set_player(self)
	# Initialize the state machine
	state_machine.initial_state = $StateMachine/IdleState

func _physics_process(delta):
	# Delegate the state management to the state machine
	state_machine._physics_process(delta)
	move_and_slide()

func _process(delta):
	state_machine._process(delta)

# This function remains for returning the player position
func get_player_position() -> Vector2:
	return self.position
