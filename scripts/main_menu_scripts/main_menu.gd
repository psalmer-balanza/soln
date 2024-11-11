extends Control
##The values required in order to have the player resume the game properly
## PlayerState.player_badges
## Global.current_floor = 1
## DialogueState.current_quest
## PlayerState.saved_scene
## PlayerState.saved_position
## PlayerState.first_time_initializing_first_floor_scene 
## PlayerState.first_time_initializing_second_floor_scene 
## PlayerState.first_time_initializing_third_floor_scene

func _ready():
	if Global.is_online:
		$"ONLINE LABEL".visible = true
		$"OFFLINE LABEL".visible = false
	elif !Global.is_online:
		$"OFFLINE LABEL".visible = false
		$"OFFLINE LABEL".visible = true
	print("Current IP address: ", Global.host_ip)
	#read the db and check if it has all the parameters for loading player state
	#if unavailable then make load game unclickable
	###PLACEHOLDER ASSUMING YOU READ SAVE STATE STUFF FROM DB
	#PlayerState.player_badges = {
		#"shiny_rock": true,
		#"bowl": true,
		#"carrot": true,
		#"cake": true,
		#"sword": false,
		#"mushroom": false,
		#"bucket1": false,
		#"flask": false,
		#"bucket2": false,
		#"bucket3": false,
		#"crystal_ball": false,
		#"shell": false,
		#"original_robot": false
	#}
	#Global.current_floor = 1
	#PlayerState.saved_scene = "res://scenes/levels/Floor1.tscn"
	#DialogueState.current_quest = "share_pie_with_raket"
	#PlayerState.first_time_initializing_first_floor_scene = false
	#PlayerState.first_time_initializing_second_floor_scene = true
	#PlayerState.first_time_initializing_third_floor_scene = true
	#PlayerState.saved_position = Vector2(1232.74, 1043.073)
	
func _on_new_game_pressed() -> void:
	print("New game initiated, resetting all player variables")
	#If new game, reset all variables
	PlayerState.first_time_initializing_first_floor_scene = true
	PlayerState.first_time_initializing_second_floor_scene = true
	PlayerState.first_time_initializing_third_floor_scene = true
	DialogueState.current_quest = "starting"
	PlayerState.player_badges = {
	"shiny_rock": false,
	"bowl": false,
	"carrot": false,
	"cake": false,
	"sword": false,
	"mushroom": false,
	"bucket1": false,
	"flask": false,
	"bucket2": false,
	"bucket3": false,
	"crystal_ball": false,
	"shell": false,
	"original_robot": false
	}
	Global.current_floor = 1
	get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit(0)

func _on_load_game_pressed() -> void:
	print("Loading game based on saved variables, current floor: ", Global.current_floor)
	match Global.current_floor:
		1:
			get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/levels/Floor2.tscn")
		3:
			get_tree().change_scene_to_file("res://scenes/levels/Floor3.tscn")
