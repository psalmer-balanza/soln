extends Camera2D

@export var randomStrength: float = 10.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0

var shaking = false

func apply_shake():
	shake_strength = randomStrength

func _process(delta):
	if shaking:
		apply_shake()
	
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shakeFade * delta)
		offset = randomOffset()

func shake():
	shaking = true

func stop_shake():
	shaking = false

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
