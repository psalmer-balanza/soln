# IdleState.gd
extends State
class_name IdleState
@export var player: CharacterBody2D
@onready var auto_start_encounter_finder = $"../../AutoStartEncounterFinder"
var auto_start_encounters: Array[Area2D] = []

func Enter():

	if player:
		var sprite = player.get_node("AnimatedSprite2D")  # Correctly access the child node
		sprite.play("idle")
		player.velocity = Vector2.ZERO
	else:
		print("No player")

func Update(delta: float):
	auto_start_encounters = auto_start_encounter_finder.get_overlapping_areas()

	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		Transitioned.emit(self, "MovingState")
		return
		
	if Input.is_action_just_pressed("ui_accept"):
		Transitioned.emit(self, "PlayerDialogueState")
	
	# Continuously check for overlapping areas
	if auto_start_encounters.size() > 0:
		print("AUTO START")
		Transitioned.emit(self, "PlayerDialogueState")
		return  # Exit early if a dialogue starts


func Physics_Update(delta: float):
	player.velocity = player.velocity.move_toward(Vector2.ZERO, player.movement_speed * delta)
