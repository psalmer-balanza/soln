extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerState.saved_scene == "res://scenes/levels/Floor2.tscn" and PlayerState.first_time_initializing_second_floor_scene == false:
		var player_node = get_node("MainCharacter")
		if player_node:
			player_node.position = PlayerState.saved_position
			print("Restored player position: ", PlayerState.saved_position)
	else:
		print("First time initializing Floor2, starting at spawn area")
		PlayerState.saved_scene = "res://scenes/levels/Floor2.tscn"
		Global.current_floor = 2
		PlayerState.first_time_initializing_second_floor_scene = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if DialogueState.disable_chip_quest:
		$Chip/ChipBarrier.disabled = true
	if DialogueState.current_quest == "after_meeting_wizard_rat":
		$Rat/RatBarrier.disabled = true
	if DialogueState.current_quest == "after_wizard_training_room":
		$RatTrainingArea/TrainingAreaBarrier.disabled = true
