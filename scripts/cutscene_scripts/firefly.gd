extends CharacterBody2D

var speed = 1000
var accel = 7
# Child nodes
@onready var particles: GPUParticles2D = $GPUParticles2D
@onready var point_light: PointLight2D = $PointLight2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _ready():
	particles.emitting = true  # Start particle emission if needed
	animation_player.play("flicker")  # Play the idle animation

func _physics_process(delta: float):
	var direction = Vector3()
	nav.target_position = get_global_mouse_position()
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
	
