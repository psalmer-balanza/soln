extends Node2D
class_name CustomDraggable

signal drag_started(event_position)
signal drag_ended

func object_held_down(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				emit_signal("drag_started", event.position)
			elif not event.pressed:
				emit_signal("drag_ended")
