extends Node

var sai_quest_status: String = ""

func change_scene_to_game():
	get_tree().change_scene_to_file("res://scenes/gameplay_scenes/worded_to_fraction_gameplay.tscn")

func boss_gameplay():
	get_tree().change_scene_to_file("res://scenes/gameplay_scenes/battle.tscn")
	
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
	print("Saisai rock moved")
