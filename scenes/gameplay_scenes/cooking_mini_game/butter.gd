extends Area2D

@onready var label = $"../UI/butter/MarginContainer/Label"
var container:Array[CharacterBody2D] = []

func _process(delta: float) -> void:
	label.text = "Butter: " + str(container.size()) + " / 2"

func _on_body_entered(body: Node2D) -> void:
	container.append(body)

func _on_body_exited(body: Node2D) -> void:
	container.erase(body)
