# Player.gd
extends CharacterBody2D

var movement_speed : float = 150.0
var character_direction : Vector2
var raket_blacksmithing_scene_done: bool = false

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Use the state machine
@onready var state_machine: Node = $StateMachine  # Assuming the state machine is a child of the player

@onready var actionable_finder: Area2D = $ActionableFinder

func _ready():
	# Pass the player (self) to the state machine
	state_machine.set_player(self)
	# Initialize the state machine
	state_machine.initial_state = $StateMachine/IdleState
	print('hello')
	#$RaketSmithing.visible = false
func _physics_process(delta):
	# Delegate the state management to the state machine
	state_machine._physics_process(delta)
	move_and_slide()
	if DialogueState.do_raket_blacksmith_animation and not raket_blacksmithing_scene_done:
		print("Entered")
		$RaketSmithing.visible = true
		raket_blacksmithing_scene_done = true
		animation_player.play("raket_smithing")
		await animation_player.animation_finished
		#$RaketSmithing.visible = false


func _process(delta):
	state_machine._process(delta)

# This function remains for returning the player position
func get_player_position() -> Vector2:
	return self.position
