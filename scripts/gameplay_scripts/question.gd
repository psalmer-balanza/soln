extends Control

@onready var content = $container/VBoxContainer/Content
@onready var c1:Button = $"container/VBoxContainer/Answers/a/Choice 1"
@onready var c2:Button = $"container/VBoxContainer/Answers/b/Choice 2"
@onready var c3:Button = $"container/VBoxContainer/Answers/c/Choice 3"
@onready var c4:Button = $"container/VBoxContainer/Answers/d/Choice 4"
@onready var mc_questions = GetQuiz.mc_questions
var index
var correct_answer
var answer
var rng = RandomNumberGenerator.new()
var question

func _ready():
	# First connect to the "questions_loaded" signal to know when the data is ready
	GetQuiz.connect("questions_loaded", _on_questions_loaded)

func _on_questions_loaded():
	mc_questions = GetQuiz.mc_questions
	print("question dictionary size: ", mc_questions.size())

# can change for better randomness using shuffle bags
func _choose_question() -> int:
	return RandomNumberGenerator.new().randi_range(0, mc_questions.size()) - 1

func _on_choice_1_pressed() -> void:
	answer = c1.text
	_check_answer()

func _on_choice_2_pressed() -> void:
	answer = c2.text
	_check_answer()

func _on_choice_3_pressed() -> void:
	answer = c3.text
	_check_answer()

func _on_choice_4_pressed() -> void:
	answer = c4.text
	_check_answer()

func _check_answer():
	if answer == correct_answer:
		GetQuiz.Enemy_HP -= 10
		visible=false
		Global.Question_Dictionary.remove_at(index)
		#This current quest changer should be wherever the final question/end of quiz is
		DialogueState.current_quest = "snake_quiz_complete"
		mc_questions.remove_at(index)
	else:
		print("Incorrect answer")
	GetQuiz.Question = false

func _on_draw() -> void:
	index = _choose_question()
	print(mc_questions)
	question = mc_questions[index]
	content.text = question[0]
	c1.text = question[1]
	c2.text = question[2]
	c3.text = question[3]
	c4.text = question[4]
	correct_answer = question[5]
