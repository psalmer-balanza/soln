extends Node2D
@onready var animation_player: AnimationPlayer = $"AnimationPlayer"

var has_moved_rock = false
var show_speech_bubble = true

func _process(_delta):
	if DialogueState.current_quest == "saisai_house_invite" and not has_moved_rock:
		play_move_rock()
		has_moved_rock = true
	if DialogueState.remove_saisai_speech_bubble == true: 
		$Saisai/SpeechBalloon.visible = false
	if DialogueState.disable_saisai_moving_rocks_quest:
		$Saisai/Actionable/CollisionShape2D.disabled = true

func _ready():
	if DialogueState.disable_saisai_moving_rocks_quest:
		$Saisai/Actionable/CollisionShape2D.disabled = true

func play_move_rock() -> void:
	DialogueState.remove_saisai_speech_bubble = true 
	$Saisai/CollisionPolygon2D.disabled = true
	animation_player.play("saisai_move_rock")
	await animation_player.animation_finished
	animation_player.play("moving_wheelbarrow")
	await animation_player.animation_finished
	$Saisai/AnimatedSprite2D.visible = false
	$WheelbarrowWithRocks.visible = false
	DialogueState.in_dialogue = false
	$RegularRock/Barrier.disabled = true
	$WheelbarrowWithRocks/CollisionPolygon2D.disabled = true
	$Wheelbarrow/CollisionPolygon2D.disabled = true
	DialogueState.remove_saisai_speech_bubble = false
	has_moved_rock = true
	
