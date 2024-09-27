extends Node

var current_quest: String = "starting"

var in_dialogue: bool = false
var evil_soln_quest_status: int = 0
var dead_robot_quest_status: String = "first_time"

var saisai_quest_progress: int = 0;
var current_npc: String = "none"

# For movable shiny rock cutscene
var rock_removed: bool = false
func remove_rock():
	rock_removed = true
	emit_signal("rock_removed")
	print("Rock has been removed!")

# For saisai moving rock cutscene
var saisai_rock_moved: bool = false
func saisai_move_rocks_cutscene():
	saisai_rock_moved = true
	emit_signal("saisai_rock_moved")
	saisai_quest_progress = 1
	print("Saisai rock moved")
