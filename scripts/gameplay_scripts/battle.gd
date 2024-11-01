extends Control
@onready var attack_button = $Actions/Attack
@onready var enemy_hp = $"Enemy HP"
@onready var question = $Question
@onready var actions = $Actions
@onready var question_bg = $"Question BG"

func _ready() -> void:
	Global.Snekker_HP = 100

func _process(delta: float) -> void:
	enemy_hp.value = Global.Snekker_HP
	if Global.Snekker_question == true:
		question.show()
		question_bg.show()
	else:
		question.hide()
		question_bg.hide()
	
	if Global.Snekker_HP == 0:
		DialogueState.current_quest = "snake_quiz_complete"
		Statistics.postQuizScore(PlayerState.student_id, PlayerState.classroom_id, 5, Global.total_score)
		get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")

func _on_attack_pressed() -> void:
	Global.Snekker_question = true
