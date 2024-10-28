extends Node

var current_quest: String = "starting"
var in_dialogue: bool = false

var evil_soln_quest_status: int = 0
var dead_robot_quest_status: String = "first_time"
var disable_dead_robot_quest: bool = false

#
#var current_npc: String = "none"
#var sword_pieces_complete = false
var raket_sword_complete: bool = false
#var snake_defeated: bool = false
var raket_sneaking_quest_complete: bool = false
#var raket_house_quest_complete: bool = false
var should_I_delete_raket_stealing_scene: bool = false
var unlock_cave_collision: bool = false

var raket_quest_progress: int = 0

# For movable shiny rock cutscene
var rock_removed: bool = false
var disable_rock_removed = false

#MOVE USEFUL VARIABLES HERE
var do_raket_blacksmith_animation: bool = false

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

#SWORD STUFF
var sword_bottom: bool = false
var sword_guard: bool = false
var sword_lower_blade: bool = false
var sword_middle_blade: bool = false
var sword_top_blade: bool = false


func get_quest_status(quest_name: String) -> bool:
	var is_quest_compelete = false
	
	if quest_name == "dead_robot_quest":
		is_quest_compelete = disable_dead_robot_quest
		
	if quest_name == "raket_stealing_quest":
		is_quest_compelete = should_I_delete_raket_stealing_scene
	
	return is_quest_compelete
