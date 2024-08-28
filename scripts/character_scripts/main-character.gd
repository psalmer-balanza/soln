extends CharacterBody2D

const SPEED = 100.0

var player_state

func _ready():
	pass

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		if direction.x != 0:
			direction.y = 0
		if direction.y != 0:
			direction.x = 0

	velocity = direction * SPEED
	move_and_slide()
	
	play_anim(direction)

func play_anim(dir):
	# Idle state animation
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	
	if player_state == "walking":
		# Walking state (WASD)
		if dir.y == -1:
			$AnimatedSprite2D.play("up-walk")
		if dir.x == 1:
			$AnimatedSprite2D.play("side-walk")
			$AnimatedSprite2D.scale.x = 1
		if dir.y == 1:
			$AnimatedSprite2D.play("down-walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("side-walk")
			$AnimatedSprite2D.scale.x = -1
