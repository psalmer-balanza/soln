extends AnimatedSprite2D

@export var move_speed: float = 100.0  # Movement speed
@export var wander_time: float = 3.0  # Time between random direction changes
@export var wander_range: float = 500.0  # Max range from original position

var move_direction: Vector2 = Vector2.ZERO
var wander_timer: float = 0.0
var original_position: Vector2

func _ready():
	original_position = position
	randomize_wander()

func _physics_process(delta: float):
	# Reduce the wander timer as time passes
	wander_timer -= delta
	if wander_timer <= 0.0:
		randomize_wander()

	# Check if the enemy is moving too far away from the original position
	if (position - original_position).length() > wander_range:
		move_direction = (original_position - position).normalized()

	# Move the enemy in the chosen direction
	velocity = move_direction * move_speed
	move_and_slide()

# Function to change the movement direction and reset the wander timer
func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()  # Choose random direction
	wander_timer = randf_range(1, wander_time)  # Reset timer for next direction change
