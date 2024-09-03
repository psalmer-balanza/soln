extends CharacterBody2D

var movement_speed : float = 80.0
var character_direction : Vector2
enum States { IDLE, MOVE }
var current_state = States.IDLE

func _ready():
	pass

func _physics_process(delta):
	# Know current state
	handle_state_transitions()
	perform_state_actions(delta)
	move_and_slide()

func handle_state_transitions():
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		current_state = States.MOVE
	else:
		current_state = States.IDLE
		#velocity = velocity.move_toward()

func perform_state_actions(delta):
	match current_state: 
		States.MOVE:
			character_direction.x = Input.get_axis("ui_left", "ui_right")
			character_direction.y = Input.get_axis("ui_up", "ui_down")
			character_direction = character_direction.normalized()
			
			if character_direction.x < 0 && character_direction.y == 0:
				$AnimatedSprite2D.animation = "side-walk"
			
			if character_direction.x > 0 && character_direction.y == 0:
				$AnimatedSprite2D.animation = "side-walk"
				
			if character_direction.y < 0:
				$AnimatedSprite2D.animation = "up-walk"
				
			if character_direction.y > 0:
				$AnimatedSprite2D.animation = "down-walk"
				
			velocity = character_direction * movement_speed
			
		States.IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
			$AnimatedSprite2D.animation = "idle"
				
			
