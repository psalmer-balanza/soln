extends Node

# For saving states
var first_time_initializing_floor_scene: bool = true
var saved_position: Vector2
var saved_scene: String = "res://scenes/levels/Floor1.tscn"
var player_in_dialogue: bool = false

func save_player_state(position: Vector2, current_scene: String):
	saved_position = position
	saved_scene = current_scene

# First argument: where you wanna go
# Second argument: where you are
func save_player_position_and_change_scene(new_scene: String, current_scene: String):
	first_time_initializing_floor_scene = false
	# Assuming you have a reference to the player node in the current scene
	var current1_scene = get_tree().current_scene
	var player_node = current1_scene.get_node("MainCharacter")  # Adjust this path to match your scene tree
	if player_node:
		print("Player node found")
		saved_position = player_node.get_player_position()  # Call the function from Player.gd
		saved_scene = current_scene  # Save the current scene
		print("Current scene: ",current_scene)
		change_scene(new_scene)
	else:
		print("Player node not found")

func change_scene(new_scene: String):
	print("Changing to new scene: ", new_scene)
	get_tree().change_scene_to_file(new_scene)

func boss_gameplay():
	get_tree().change_scene_to_file("res://scenes/gameplay_scenes/battle.tscn")
	
func change_scene_to_floor2():
	get_tree().change_scene_to_file("res://scenes/levels/Floor2.tscn")
