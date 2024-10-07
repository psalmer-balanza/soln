extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var raket_steal = false

func _process(_delta):
	if DialogueState.raket_sneaking and not raket_steal:
		raket_stealing()
		raket_steal = true

func raket_stealing() -> void:
	print("raket is here")
	$AnimatedSprite2D
	animation_player.play("raket_stealing")
	await animation_player.animation_finished
	raket_steal = true
	
