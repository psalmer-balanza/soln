extends Control

@export var next_scene: PackedScene
@onready var label: Label = $MarginContainer2/MarginContainer/Label



func _ready() -> void:
	print("PRINT", DialogueState.current_quest)
	if DialogueState.current_quest == "saisai_wheelbarrow":
		label.text = "Congratulations:\nYou have solved\nSaisai's problems!"
	elif DialogueState.current_quest == "dead_robots":
		label.text = "Congratulations:\nYou have passed\nOld Peculiar's trial!"
func _on_correct_pressed():
	get_tree().change_scene_to_packed(next_scene)
