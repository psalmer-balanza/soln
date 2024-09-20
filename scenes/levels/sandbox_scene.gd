extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerState.saved_scene == "res://scenes/levels/sandbox_scene.tscn" and PlayerState.first_time_initializing_floor_scene == false:
		var player_node = get_node("MainCharacter")
		if player_node:
			player_node.position = PlayerState.saved_position
			print("Restored player position: ", PlayerState.saved_position)
	else: 
		print("First time initializing sandbox")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
