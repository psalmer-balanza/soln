extends Node2D

func _ready() -> void:
	$Character.play("game_over")

func _on_character_animation_finished() -> void:
	$Character.play("default")

func _on_submit_answer_pressed() -> void:
	Global.user_energy = 3
	match Global.current_floor:
		1:
			get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/levels/Floor2.tscn")
