extends Control

@onready var content = $CenterContainer/Content
@onready var c1:Button = $"container/VBoxContainer/Answers/a/Choice 1"
@onready var c2:Button = $"container/VBoxContainer/Answers/b/Choice 2"
@onready var c3:Button = $"container/VBoxContainer/Answers/c/Choice 3"
@onready var c4:Button = $"container/VBoxContainer/Answers/d/Choice 4"
@onready var question_dictionary = Global.Question_Dictionary
var index
var correct_answer
var answer
var rng = RandomNumberGenerator.new()
var question

func _ready():
	# First connect to the "questions_loaded" signal to know when the data is ready
	Global.connect("questions_loaded", _on_questions_loaded)

func _on_questions_loaded():
	question_dictionary = Global.Question_Dictionary
	print(question_dictionary)

# can change for better randomness using shuffle bags
func _choose_question() -> int:
	return RandomNumberGenerator.new().randi_range(1, question_dictionary.size())

func _on_choice_1_pressed() -> void:
	answer = $"Answers/Choice 1".text
	_check_answer()

func _on_choice_2_pressed() -> void:
	answer = $"Answers/Choice 2".text
	_check_answer()

func _on_choice_3_pressed() -> void:
	answer = $"Answers/Choice 3".text
	_check_answer()

func _on_choice_4_pressed() -> void:
	answer = $"Answers/Choice 4".text
	_check_answer()

func _check_answer():
	if answer == correct_answer:
		Global.Enemy_HP -= 10
	else:
		print("Incorrect answer")
	question_dictionary.erase(index)
	Global.Question = false

func _on_draw() -> void:
	index = _choose_question()
	print(question_dictionary)
	question = question_dictionary.get(index)
	content.text = question[0]
	c1.text = question[1]
	c2.text = question[2]
	c3.text = question[3]
	c4.text = question[4]
	correct_answer = question[5]
