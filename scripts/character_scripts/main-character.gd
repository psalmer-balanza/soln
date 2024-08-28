extends CharacterBody2D

const SPEED = 100.0

var player_state

func _ready():
	pass

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction == Vector2.ZERO:
		player_state = "idle"
	else:
		player_state = "walking"

	velocity = direction * SPEED  # Set the velocity property of CharacterBody2D

	move_and_slide()  # Correct usage in Godot 4

	play_anim(direction)

func play_anim(dir):
	# Idle state animation
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	elif player_state == "walking":
		# Walking state (WASD)
		if dir.y == -1:
			$AnimatedSprite2D.play("up-walk")
		elif dir.y == 1:
			$AnimatedSprite2D.play("down-walk")
		elif dir.x == 1:
			$AnimatedSprite2D.play("side-walk")
			$AnimatedSprite2D.scale.x = 1
		elif dir.x == -1:
			$AnimatedSprite2D.play("side-walk")
			$AnimatedSprite2D.scale.x = -1
