extends Node

var sai_quest_status: String = ""

func change_scene_to_game():
	get_tree().change_scene_to_file("res://scenes/gameplay_scenes/fraction_sample_gameplay.tscn")

signal rock_removed_signal

var rock_removed: bool = false

func remove_rock():
	rock_removed = true
	emit_signal("rock_removed_signal")
	print("Rock has been removed!")
