# MoveState.gd
extends State
class_name MovingState

var player: CharacterBody2D

func Enter():
	
	var sprite = player.get_node("AnimatedSprite2D")  # Correctly access the child node
	sprite.play("walk")

func Update(delta: float):
	if not (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")):
		Transitioned.emit(self, "IdleState")
		return
		
	if Input.is_action_just_pressed("ui_accept"):
		Transitioned.emit(self, "PlayerDialogueState")

func Physics_Update(delta: float):
	# This is for direction, takes it from input
	var character_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	
	# Handle animations based on direction
	if character_direction.x < 0 and character_direction.y == 0:
		player.get_node("AnimatedSprite2D").play("walk")
		player.get_node("AnimatedSprite2D").scale.x = -1  # Face left
	elif character_direction.x > 0 and character_direction.y == 0:
		player.get_node("AnimatedSprite2D").play("walk")
		player.get_node("AnimatedSprite2D").scale.x = 1  # Face right
	elif character_direction.y < 0:
		player.get_node("AnimatedSprite2D").play("walk")  # Walking up
	elif character_direction.y > 0:
		player.get_node("AnimatedSprite2D").play("walk")  # Walking down

	# Apply movement velocity
	player.velocity = character_direction * player.movement_speed
