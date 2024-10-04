extends Node2D
@onready var animation_player: AnimationPlayer = $"AnimationPlayer"


var has_moved_rock = false

func _process(_delta):
	if DialogueState.saisai_rock_moved and not has_moved_rock:
		play_move_rock()
		has_moved_rock = true

func play_move_rock() -> void:
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
	has_moved_rock = true
	
