# IdleState.gd
extends State

@export var player: CharacterBody2D
@export var movement_speed: float = 150.0

func enter():
	# Set idle animation
	$player.AnimatedSprite2D.play("idle")
	$player.velocity = Vector2.ZERO

func update(delta: float):
	# Check if player starts moving
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		emit_signal("transitioned", "MoveState")

func physics_update(delta: float):
	# Slow down the player when idle
	$player.velocity = $player.velocity.move_toward(Vector2.ZERO, movement_speed * delta)
