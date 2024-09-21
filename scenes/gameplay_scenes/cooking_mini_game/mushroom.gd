extends Area2D

@onready var label = $"../UI/mushroom/MarginContainer/Label"
var container:Array[CharacterBody2D] = []

func _process(delta: float) -> void:
	label.text = "Mushroom: " + str(container.size()) + " / 3"

func _on_body_entered(body: Node2D) -> void:
	print("item entered")
	container.append(body)
	print(container.size())
	
func _on_body_exited(body: Node2D) -> void:
	print("item exited")
	container.erase(body)
	print(container.size())
