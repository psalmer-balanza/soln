# IdleState.gd
extends State
class_name IdleState
@export var player: CharacterBody2D
@onready var actionable_finder: Area2D = $"../../ActionableFinder"
@onready var auto_start_encounter_finder = $"../../AutoStartEncounterFinder"
var auto_start_encounters: Array[Area2D] = []
var in_dialogue: bool = false

func Enter():
	in_dialogue = false  # Reset dialogue state when entering idle state
	if player:
		var sprite = player.get_node("AnimatedSprite2D")  # Correctly access the child node
		sprite.play("idle")
		player.velocity = Vector2.ZERO
	else:
		print("No player")

func Update(_delta: float):
	auto_start_encounters = auto_start_encounter_finder.get_overlapping_areas()
	
	# If they already in dialogue then just bring you back to the dialogue state
	# This is for when you return FROM a different scene to floor1 and 
	# you aren't already in the dialogue state
	if DialogueState.in_dialogue:
		Transitioned.emit(self, "PlayerDialogueState") 

	# Prevent player from entering dialogue state multiple times
	if in_dialogue:
		return  # Do not process input while in dialogue

	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		Transitioned.emit(self, "MovingState")
		return
		
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			in_dialogue = true
			Transitioned.emit(self, "PlayerDialogueState") 
		else:
			print("no dialogue found")
	
	# Continuously check for overlapping areas
	if auto_start_encounters.size() > 0:
		in_dialogue = true
		Transitioned.emit(self, "PlayerDialogueState")
		return  # Exit early if a dialogue starts


func Physics_Update(delta: float):
	player.velocity = player.velocity.move_toward(Vector2.ZERO, player.movement_speed * delta)
