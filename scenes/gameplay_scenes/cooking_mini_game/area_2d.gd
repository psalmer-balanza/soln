extends Area2D

@onready var item_container = $"../ItemContainer"
@onready var label = $"../Label"

var container:Array[CharacterBody2D] = []

func _process(delta: float) -> void:
	label.text = "Items: " + str(container.size())

func _on_body_entered(body: Node2D) -> void:
	print("item entered")
	container.append(body)
	print(container.size())

func _on_body_exited(body: Node2D) -> void:
	print("item exited")
	container.erase(body)
	print(container.size())
