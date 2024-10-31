extends Node2D

@onready var animation_player: AnimationPlayer = $"AnimationPlayer"

var has_robot_appeared = false
var has_robot_disappeared = false

func _process(_delta):
	if DialogueState.current_quest == "dead_robots_appear" and not has_robot_appeared:
		robots_appear()
		has_robot_appeared = true
	elif DialogueState.current_quest == "dead_robots_done" and not has_robot_disappeared:
		robots_disappear()

func _ready():
	if DialogueState.current_quest == "dead_robots" or DialogueState.current_quest == "dead_robots_gameplay_done":
		print("default in ready")
		robots_appear()

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
	
