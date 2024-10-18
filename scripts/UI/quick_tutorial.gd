extends Control

@export var next:Control

func _on_close_button_pressed() -> void:
	if next != null:
		next.visible = true
	visible = false
