extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# to fix final boss online bug, load questions as early as loading floor 3
	if Global.is_online:
		QuestionsLoader.get_final_boss_questions()
		
	if PlayerState.saved_scene == "res://scenes/levels/Floor3.tscn" and PlayerState.first_time_initializing_third_floor_scene == false:
		var player_node = get_node("MainCharacter")
		if player_node:
			player_node.position = PlayerState.saved_position
			print("Restored player position: ", PlayerState.saved_position)
	else:
		print("First time initializing Floor3, starting at spawn area")
		PlayerState.saved_scene = "res://scenes/levels/Floor3.tscn"
		Global.current_floor = 3
		PlayerState.first_time_initializing_third_floor_scene = false
