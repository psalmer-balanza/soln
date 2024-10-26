extends Node2D

@onready var animation_player: AnimationPlayer = $"AnimationPlayer"
@onready var dead_robot_scene = $"."

var has_robot_appeared = false
var has_robot_disappeared = false

func _process(_delta):
	if DialogueState.dead_robot_appeared and not has_robot_appeared:
		robots_appear()
		has_robot_appeared = true
	if DialogueState.dead_robot_disappeared and not has_robot_disappeared:
		robots_disappear()


func robots_appear() -> void:
	animation_player.play("robots_appear")
	await animation_player.animation_finished
	print("Robots appeared")
	
	has_robot_appeared = true
	
func robots_disappear() -> void:
	animation_player.play("robots_disappear")
	await animation_player.animation_finished
	print("Robots disappeared")
	
	has_robot_disappeared = true
	
