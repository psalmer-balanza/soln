extends Control
@onready var attack_button = $Actions/Attack
@onready var enemy_hp = $"Enemy HP"
@onready var question = $Question
@onready var actions = $Actions
@onready var question_bg = $"Question BG"

func _ready() -> void:
	GetQuiz.Enemy_HP = 100

func _process(delta: float) -> void:
	enemy_hp.value = Global.Enemy_HP
	if Global.Question == true:
		question.show()
		question_bg.show()
	else:
		question.hide()
		question_bg.hide()

func _on_attack_pressed() -> void:
	Global.Question = true
