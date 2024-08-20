extends CharacterBody2D

const SPEED = 250.0

var player_state

func _ready():
	pass

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"

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
			$AnimatedSprite2D.play("right-side-walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("down-walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("left-side-walk")
