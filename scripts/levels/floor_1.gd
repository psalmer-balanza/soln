extends Node2D
var remove_saisai_barrier = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print(DialogueState.current_quest)
	if PlayerState.saved_scene == "res://scenes/levels/Floor1.tscn" and PlayerState.first_time_initializing_floor_scene == false:
		var player_node = get_node("MainCharacter")
		if player_node:
			player_node.position = PlayerState.saved_position
			print("Restored player position: ", PlayerState.saved_position)
	else:
		print("First time initializing Floor1, starting at spawn area")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if DialogueState.unlock_cave_collision:
		$Racket/BarrierFromCave.disabled = true
	if DialogueState.current_quest == "find_raket_house" or remove_saisai_barrier:
		$Saisai/BarrierFromBridge.disabled = true
		remove_saisai_barrier = true
