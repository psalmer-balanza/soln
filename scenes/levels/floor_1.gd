extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if State.saved_scene == "res://scenes/levels/Floor1.tscn" and State.first_time_initializing_floor_scene == false:
		var player_node = get_node("MainCharacter")
		if player_node:
			player_node.position = State.saved_position
			print("Restored player position: ", State.saved_position)
	else: 
		print("First time initializing floor1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
