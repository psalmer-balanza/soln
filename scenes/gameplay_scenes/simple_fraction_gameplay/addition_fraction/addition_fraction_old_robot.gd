extends Control

@onready var congrats_screen = $Congrats
@onready var fraction_problem = $FractionProblem

@onready var animation_player: AnimatedSprite2D = $Robot

func _ready() -> void:
	animation_player.visible = true

func _on_fraction_problem_all_done() -> void:
	congrats_screen.visible = true

func _on_fraction_problem_correct() -> void:
	animation_player.play("correct")
	await animation_player.animation_finished
	animation_player.play("idle")

func _on_fraction_problem_incorrect() -> void:
	animation_player.play("wrong")
	await animation_player.animation_finished
	animation_player.play("idle")
