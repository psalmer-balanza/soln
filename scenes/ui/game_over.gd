extends Node2D

func _ready() -> void:
	$Character.play("game_over")

func _on_character_animation_finished() -> void:
	$Character.play("default")

func _on_submit_answer_pressed() -> void:
	pass # Replace with function body.
