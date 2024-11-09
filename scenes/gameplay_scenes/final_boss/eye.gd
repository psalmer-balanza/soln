extends Node2D

@onready var sprite = $Sprite2D

@onready var origin = position
var max_distance = 50

func _process(delta: float) -> void:
	var mouse_pos = get_local_mouse_position()
	var dir = Vector2.ZERO.direction_to(mouse_pos)
	var dist = mouse_pos.length()
	var new_position = dir * min(dist, max_distance)
	
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "position", new_position, 0)
