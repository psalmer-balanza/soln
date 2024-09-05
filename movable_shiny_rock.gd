extends Node2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

var has_hidden_rock = false

func _process(_delta):
	if State.rock_removed and not has_hidden_rock:
		hide_rock()
		has_hidden_rock = true

func hide_rock():
	animation_player.play("rock_disappear")
	await animation_player.animation_finished
	print("Rock disappeared")
	$CollisionPolygon2D.disabled = true
	$Sprite2D.visible = false
	has_hidden_rock = true
	
