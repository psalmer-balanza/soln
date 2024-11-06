extends Control

@export var next_scene: PackedScene
@onready var label: Label = $MarginContainer2/MarginContainer/Label



func _ready() -> void:
	if DialogueState.current_quest == "saisai_wheelbarrow":
		label.text = "Congratulations:\nYou have solved\nSaisai's problems!"
	elif DialogueState.current_quest == "dead_robots":
		label.text = "Congratulations:\nYou have passed\nOld Peculiar's trial!"
	elif DialogueState.current_quest == "meeting_chip":
		label.text = "Congratulations:\nYou have opened the safe!"
	elif DialogueState.current_quest == "water_room_3":
		label.text = "Congratulations:\nYou have earned a Flask badge!"
		
func _on_correct_pressed():
	print("Congratulations screen, current quest: ", DialogueState.current_quest)
	get_tree().change_scene_to_packed(next_scene)
	
