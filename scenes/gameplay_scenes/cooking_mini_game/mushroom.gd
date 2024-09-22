extends Area2D

@onready var label = $"../UI/mushroom/MarginContainer/Label"
var container:Array[CharacterBody2D] = []

func _process(delta: float) -> void:
	label.text = "Mushroom: " + str(container.size()) + " / 3"

func _on_body_entered(body: Node2D) -> void:
	container.append(body)

func _on_body_exited(body: Node2D) -> void:
	container.erase(body)
