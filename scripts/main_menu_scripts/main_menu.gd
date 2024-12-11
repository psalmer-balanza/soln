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
		SaveState.connect("saved_data_loaded", _on_saved_data_loaded)
		SaveState.load_save_data(PlayerState.student_id)
	elif !Global.is_online:
		$"OFFLINE LABEL".visible = false
		$"OFFLINE LABEL".visible = true
	print("Current IP address: ", Global.host_ip)

func _on_saved_data_loaded():
	#read the db and check if it has all the parameters for loading player state
	PlayerState.player_badges = SaveState.player_badges
	Global.current_floor = SaveState.current_floor
	PlayerState.saved_scene = SaveState.saved_scene
	DialogueState.current_quest = SaveState.current_quest
	PlayerState.first_time_initializing_first_floor_scene = SaveState.first_time_initializing_first_floor_scene
	PlayerState.first_time_initializing_second_floor_scene = SaveState.first_time_initializing_second_floor_scene
	PlayerState.first_time_initializing_third_floor_scene = SaveState.first_time_initializing_third_floor_scene
	PlayerState.saved_position = SaveState.saved_position
	#onto actionables
	DialogueState.rock_removed = SaveState.rock_removed
	DialogueState.disable_rock_removed = SaveState.disable_rock_removed
	DialogueState.raket_sneaking_quest_complete = SaveState.raket_sneaking_quest_complete
	DialogueState.unlock_cave_collision = SaveState.unlock_cave_collision
	DialogueState.raket_sword_complete = SaveState.raket_sword_complete
	DialogueState.raket_quest_progress = SaveState.raket_quest_progress
	DialogueState.do_raket_blacksmith_animation = SaveState.do_raket_blacksmith_animation
	DialogueState.sword_bottom = SaveState.sword_bottom
	DialogueState.sword_guard = SaveState.sword_guard
	DialogueState.sword_lower_blade = SaveState.sword_lower_blade
	DialogueState.sword_middle_blade = SaveState.sword_middle_blade
	DialogueState.sword_top_blade = SaveState.sword_top_blade
	#
	DialogueState.disable_dead_robot_quest = SaveState.disable_dead_robot_quest
	DialogueState.disable_raket_stealing_quest = SaveState.disable_raket_stealing_quest
	DialogueState.disable_fresh_dialogue_quest = SaveState.disable_fresh_dialogue_quest
	DialogueState.disable_water_logged_1_quest = SaveState.disable_water_logged_1_quest
	DialogueState.disable_water_logged_2_quest = SaveState.disable_water_logged_2_quest
	DialogueState.disable_water_logged_3_quest = SaveState.disable_water_logged_3_quest
	DialogueState.disable_chip_quest = SaveState.disable_chip_quest
	DialogueState.disable_rat_wizard_training_quest = SaveState.disable_rat_wizard_training_quest
	
	print("save states are: ")
	print("player badges: ", PlayerState.player_badges)
	print("Global.current_floor: ", Global.current_floor)
	print("PlayerState.saved_scene: ", PlayerState.saved_scene)
	print("DialogueState.current_quest: ", DialogueState.current_quest)
	print("PlayerState.first_time_initializing_first_floor_scene: ", PlayerState.first_time_initializing_first_floor_scene)
	print("PlayerState.first_time_initializing_second_floor_scene: ", PlayerState.first_time_initializing_second_floor_scene)
	print("PlayerState.first_time_initializing_third_floor_scene: ", PlayerState.first_time_initializing_third_floor_scene)
	print("PlayerState.saved_position: ", PlayerState.saved_position)

	# Actionables
	
	print("DialogueState.rock_removed: ", DialogueState.rock_removed)
	print("DialogueState.disable_rock_removed: ", DialogueState.disable_rock_removed)
	print("DialogueState.raket_sneaking_quest_complete: ", DialogueState.raket_sneaking_quest_complete)
	print("DialogueState.unlock_cave_collision: ", DialogueState.unlock_cave_collision)
	print("DialogueState.raket_sword_complete: ", DialogueState.raket_sword_complete)
	print("DialogueState.raket_quest_progress: ", DialogueState.raket_quest_progress)
	print("DialogueState.do_raket_blacksmith_animation: ", DialogueState.do_raket_blacksmith_animation)
	print("DialogueState.sword_bottom: ", SaveState.sword_bottom)
	print("DialogueState.sword_guard: ", SaveState.sword_guard)
	print("DialogueState.sword_lower_blade: ", SaveState.sword_lower_blade)
	print("DialogueState.sword_middle_blade: ", SaveState.sword_middle_blade)
	print("DialogueState.sword_top_blade: ", SaveState.sword_top_blade)
	print("DialogueState.disable_dead_robot_quest: ", DialogueState.disable_dead_robot_quest)
	print("DialogueState.disable_raket_stealing_quest: ", DialogueState.disable_raket_stealing_quest)
	print("DialogueState.disable_fresh_dialogue_quest: ", DialogueState.disable_fresh_dialogue_quest)
	print("DialogueState.disable_water_logged_1_quest: ", DialogueState.disable_water_logged_1_quest)
	print("DialogueState.disable_water_logged_2_quest: ", DialogueState.disable_water_logged_2_quest)
	print("DialogueState.disable_water_logged_3_quest: ", DialogueState.disable_water_logged_3_quest)
	print("DialogueState.disable_chip_quest: ", DialogueState.disable_chip_quest)
	print("DialogueState.disable_rat_wizard_training_quest: ", DialogueState.disable_rat_wizard_training_quest)
	
	# to always set dialogue as false whenever user logs in
	DialogueState.in_dialogue = false
	print("DialogueState.indialogue : ", DialogueState.in_dialogue)
	
	
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
	# reset autoactionables
	DialogueState.rock_removed = false
	DialogueState.disable_rock_removed = false
	DialogueState.raket_sneaking_quest_complete = false
	DialogueState.unlock_cave_collision = false
	DialogueState.raket_sword_complete = false
	DialogueState.raket_quest_progress = 0
	DialogueState.do_raket_blacksmith_animation = false
	DialogueState.sword_bottom = false
	DialogueState.sword_guard = false
	DialogueState.sword_lower_blade = false
	DialogueState.sword_middle_blade = false
	DialogueState.sword_top_blade = false
	DialogueState.disable_dead_robot_quest = false
	DialogueState.disable_raket_stealing_quest = false
	DialogueState.disable_fresh_dialogue_quest = false
	DialogueState.disable_water_logged_1_quest = false
	DialogueState.disable_water_logged_2_quest = false
	DialogueState.disable_water_logged_3_quest = false
	DialogueState.disable_chip_quest = false
	DialogueState.disable_rat_wizard_training_quest = false
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
