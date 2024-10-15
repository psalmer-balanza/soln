extends Control

@onready var congrats_screen = $Congratulations
@onready var fraction_problem = $FractionProblem

var animation_player: AnimatedSprite2D

@onready var current_quest: String = DialogueState.current_quest

func _ready() -> void:
	match current_quest:
		"saisai_wheelbarrow":
			animation_player = $Saisai
			fraction_problem.quest_number = 1
		"dead_robots":
			animation_player = $Robot
			fraction_problem.quest_number = 2
	
	animation_player.visible = true

func _on_fraction_problem_all_done() -> void:
	$Congratulations.visible = true

func _on_fraction_problem_correct() -> void:
	print("seggs842")
	$CorrectAnswerSFX.play()
	animation_player.play("correct")
	await animation_player.animation_finished
	animation_player.play("idle")

func _on_fraction_problem_incorrect() -> void:
	$WrongAnswerSFX.play()
	animation_player.play("wrong")
	await animation_player.animation_finished
	animation_player.play("idle")
