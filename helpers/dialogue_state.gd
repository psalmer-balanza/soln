extends Node

var in_dialogue: bool = false

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
