extends Control

@onready var next_tutorial1 = $QuickTutorial2
@onready var next_tutorial2 = $QuickTutorial3

func _on_quick_tutorial_change() -> void:
	next_tutorial1.visible = true


func _on_quick_tutorial_2_change() -> void:
	next_tutorial2.visible = true
