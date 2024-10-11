extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerState.saved_scene == "res://scenes/levels/Floor1.tscn" and PlayerState.first_time_initializing_floor_scene == false:
		var player_node = get_node("MainCharacter")
		if player_node:
			player_node.position = PlayerState.saved_position
			print("Restored player position: ", PlayerState.saved_position)
	else: 
		print("First time initializing floor1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if DialogueState.unlock_cave_collision:
		$Racket/BarrierFromCave.disabled = true
	if DialogueState.saisai_quest_progress == 3:
		$Saisai/BarrierFromBridge.disabled = true
