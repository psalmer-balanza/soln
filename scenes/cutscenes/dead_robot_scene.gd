extends Node2D
@onready var animation_player: AnimationPlayer = $"AnimationPlayer"


var has_robot_appeared = false

func _process(_delta):
	if DialogueState.dead_robot_appeared and not has_robot_appeared:
		hide_rock()
		has_robot_appeared = true

func hide_rock() -> void:
	animation_player.play("robots_appear")
	await animation_player.animation_finished
	print("Robots appeared")
	
	has_robot_appeared = true
	
