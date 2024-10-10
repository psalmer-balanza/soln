extends Node2D

@export var move_speed := 10.0  # Speed of movement
@export var wander_time_max := 3.0  # Maximum time for wandering in one direction
@export var wander_time_min := 1.0  # Minimum time for wandering in one direction

var move_direction: Vector2 = Vector2.ZERO
var wander_timer: float = 0.0
var velocity: Vector2 = Vector2.ZERO

# Child nodes
@onready var particles: GPUParticles2D = $GPUParticles2D
@onready var point_light: PointLight2D = $PointLight2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	randomize_wander()
	particles.emitting = true  # Start particle emission if needed
	animation_player.play("idle")  # Play the idle animation

func _physics_process(delta: float):
	wander_timer -= delta
	if wander_timer <= 0:
		randomize_wander()

	# Move the Node2D (and all its children)
	velocity = move_direction * move_speed
	position += velocity * delta  # Update position based on direction and speed

	# Modify the behavior of other nodes here, like particle effects or light
	adjust_light_and_particles()

# Randomizes the movement direction and resets the wander timer
func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()  # Choose a random direction
	wander_timer = randf_range(wander_time_min, wander_time_max)  # Set a new timer for wandering

# Optional function to adjust light and particles while moving
func adjust_light_and_particles():
	# Example: Flicker light intensity based on movement speed
	point_light.energy = 1.0 + randf_range(-0.1, 0.1) * (velocity.length() / move_speed)
