# IdleState.gd
extends State
class_name IdleState
@export var player: CharacterBody2D

func Enter():

	if player:
		var sprite = player.get_node("AnimatedSprite2D")  # Correctly access the child node
		sprite.play("idle")
		player.velocity = Vector2.ZERO
	else:
		print("No player")

func Update(delta: float):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		Transitioned.emit(self, "MovingState")
		return
		
	if Input.is_action_just_pressed("ui_accept"):
		Transitioned.emit(self, "PlayerDialogueState")

func Physics_Update(delta: float):
	player.velocity = player.velocity.move_toward(Vector2.ZERO, player.movement_speed * delta)
