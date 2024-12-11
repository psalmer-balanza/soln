extends Node

var current_quest: String = "starting"
var in_dialogue: bool = false

var evil_soln_quest_status: int = 0
var dead_robot_quest_status: String = "first_time"

# Variables for disabling auto actionables PERMANENTLY after they have been complete
## FLOOR 1
var rock_removed: bool = false #
var disable_rock_removed = false #
var disable_dead_robot_quest: bool = false
var disable_raket_stealing_quest: bool = false
var raket_sneaking_quest_complete: bool = false #
var unlock_cave_collision: bool = false  #
var raket_sword_complete: bool = false #
var raket_quest_progress: int = 0 #
var do_raket_blacksmith_animation: bool = false #
#SWORD STUFF
var sword_bottom: bool = false
var sword_guard: bool = false
var sword_lower_blade: bool = false
var sword_middle_blade: bool = false
var sword_top_blade: bool = false


## FLOOR 2
var disable_fresh_dialogue_quest: bool = false
var disable_water_logged_1_quest: bool = false
var disable_water_logged_2_quest: bool = false
var disable_water_logged_3_quest: bool = false
var disable_chip_quest: bool = false
var disable_rat_wizard_training_quest: bool = false

# Post-Saisai robot cutscene
var dead_robot_appeared: bool = false
func dead_robot_scene():
	dead_robot_appeared = true

var dead_robot_disappeared: bool = false
func dead_robot_scene_finished():
	dead_robot_disappeared = true
	current_quest = "dead_robots"

var raket_sneaking: bool = false
func raket_steal_scene():
	raket_sneaking = true
	emit_signal("raket_steal")
	current_quest = "raket_stealing"

func get_quest_status(quest_name: String) -> bool:
	var is_quest_compelete = false
	
	if quest_name == "dead_robot_quest":
		is_quest_compelete = disable_dead_robot_quest
		
	if quest_name == "raket_stealing_quest":
		is_quest_compelete = disable_raket_stealing_quest
	
	if quest_name == "fresh_dialogue_quest":
		is_quest_compelete = disable_fresh_dialogue_quest
	
	if quest_name == "water_logged_1_quest":
		is_quest_compelete = disable_water_logged_1_quest
	
	if quest_name == "water_logged_2_quest":
		is_quest_compelete = disable_water_logged_2_quest
	
	if quest_name == "water_logged_3_quest":
		is_quest_compelete = disable_water_logged_3_quest
		
	if quest_name == "chip_quest":
		is_quest_compelete = disable_chip_quest
		
	if quest_name == "rat_wizard_training_quest":
		is_quest_compelete = disable_rat_wizard_training_quest
		
	return is_quest_compelete

func play_end_sequence():
	current_quest = "ending"
