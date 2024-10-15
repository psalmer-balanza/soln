extends Node2D
@onready var animation_player: AnimationPlayer = $"AnimationPlayer"


var has_hidden_rock = false

func _process(_delta):
	if DialogueState.current_quest == "movable_rock_done" and not has_hidden_rock:
		hide_rock()
		has_hidden_rock = true

func _ready():
	if DialogueState.disable_rock_removed:
		$Actionable/CollisionShape2D.disabled = true

func hide_rock() -> void:
	$Actionable/CollisionShape2D.disabled = true
	$ExclamationMark.visible = false
	animation_player.play("rock_disappear")
	await animation_player.animation_finished
	print("Rock disappeared")
	$CollisionPolygon2D.disabled = true
	$CollisionShape2D.disabled = true
	has_hidden_rock = true
	
