extends Control

signal change

func _on_close_button_pressed() -> void:
	emit_signal("change")
	visible = false
	print("from worded addition fraction")
