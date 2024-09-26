extends Area2D

@onready var label = $"../UI/garlic/MarginContainer/Label"
var container:Array[CharacterBody2D] = []
var denum = 6

func _process(delta: float) -> void:
	if container.size() != denum:
		label.text = "Garlic: " + str(container.size()) + " / " + str(denum)
	else:
		label.text = "Garlic: " + "1 Whole"

func _on_body_entered(body: Node2D) -> void:
	container.append(body)

func _on_body_exited(body: Node2D) -> void:
	container.erase(body)
