extends Node

var current_quest: String = "starting"

var in_dialogue: bool = false
var evil_soln_quest_status: int = 0
var dead_robot_quest_status: String = "first_time"
var earthquake_scene: String = "first_time"
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
	
# Post-Saisai robot cutscene
var dead_robot_appeared: bool = false
func dead_robot_scene():
	dead_robot_appeared = true
	emit_signal("dead_robot_scene")
	current_quest = "dead_robots"


#SWORD STUFF
var sword_bottom: bool = false
var sword_guard: bool = false
var sword_lower_blade: bool = false
var sword_middle_blade: bool = false
var sword_top_blade: bool = false

func pick_sword_bottom():
	sword_bottom = true
	emit_signal("sword_bottom")

func pick_sword_guard():
	sword_guard = true
	emit_signal("sword_guard")

func pick_sword_lower_blade():
	sword_lower_blade = true
	emit_signal("sword_lower_blade")
	
func pick_sword_middle_blade():
	sword_middle_blade = true
	emit_signal("sword_middle_blade")
	
func pick_sword_top_blade():
	sword_top_blade = true
	emit_signal("sword_top_blade")
