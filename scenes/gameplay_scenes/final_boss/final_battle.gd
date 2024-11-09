extends Control
@onready var attack_button = $Attack/Attack
@onready var enemy_hp = $"Enemy HP"
@onready var question = $Question
@onready var question_bg = $"Question BG"

func _ready() -> void:
	Global.guardian_enemy_hp = 100

func _process(delta: float) -> void:
	enemy_hp.value = Global.guardian_enemy_hp
	
	if Global.Giant_Enemy_Crab_question == true:
		question.show()
		question_bg.show()
	else:
		question.hide()
		question_bg.hide()
	
	if Global.guardian_enemy_hp == 0:
		DialogueState.current_quest = "crab_quiz_successful"
		Statistics.postQuizScore(PlayerState.player_username, PlayerState.classroom_id, 5, Global.total_score)
		get_tree().change_scene_to_file("res://scenes/levels/Floor3.tscn")

func _on_attack_pressed() -> void:
	Global.guardian_enemy_question = true
