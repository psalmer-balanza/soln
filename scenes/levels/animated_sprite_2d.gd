extends AnimatedSprite2D

# Movement speed of the sprite
@export var move_speed: float = 10.0

# Time interval to change direction
@export var change_direction_interval: float = 5.0

# Current movement direction
var move_direction: Vector2

# Timer to track when to change direction
var change_direction_timer: float = 0.0

func _ready():
	# Randomize the initial direction
	randomize()
	change_direction()

func _process(delta: float):
	# Move the sprite
	position += move_direction * move_speed * delta

	# Update timer
	change_direction_timer -= delta
	if change_direction_timer <= 0:
		change_direction()

func change_direction():
	# Generate a random direction
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

	# Reset the timer
	change_direction_timer = change_direction_interval
