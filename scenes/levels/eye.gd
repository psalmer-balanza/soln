extends Node2D

@onready var character = $"../../MainCharacter"
@onready var sprite = $Sprite2D

@onready var origin = position
var max_distance = 75

func _process(delta: float) -> void:
	var character_pos = character.position
	var dir = Vector2.ZERO.direction_to(character_pos)
	var dist = character_pos.length()
	var new_position = dir * min(dist, max_distance)
	
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "position", new_position, .5)
