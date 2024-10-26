extends MarginContainer

var quest_number: int

signal all_done
signal correct
signal incorrect

# place questions here
# question format per index in array is another array [numerator 1, denominator 1, numerator 2, denominator 2, operation]
var questions = [
	[1, 4, 1, 6, "+"],    
	[1, 3, 2, 6, "+"],    
	[2, 5, 3, 10, "+"],   
	[1, 8, 2, 8, "+"],    
	[3, 7, 1, 14, "+"],   
	[1, 6, 2, 3, "+"],    
	[3, 10, 2, 5, "+"],   
	[2, 9, 1, 3, "+"],    
	[1, 4, 3, 8, "+"],    
	[2, 15, 5, 15, "+"],  
	[1, 5, 2, 10, "+"],
	[1, 7, 3, 14, "+"],   
	[3, 8, 2, 8, "+"],
	[1, 12, 1, 4, "+"],   
	[2, 10, 1, 5, "+"],
	[1, 9, 4, 9, "+"],   
	[3, 16, 5, 8, "+"],   
	[1, 6, 1, 12, "+"],   
	[2, 8, 3, 4, "+"],   
	[1, 5, 3, 10, "+"]
]


var current_chosen_questions: Array = []
var chosen_index_questions: Array[int] = []
var num_right_ans: int
var num_wrong_ans: int

var question_index:int = 0
# numerator and denominator of first and second fraction
@onready var denum1 = $VBoxContainer/Problem/Fraction1/VBoxContainer/Denominator
@onready var num1 = $VBoxContainer/Problem/Fraction1/VBoxContainer/Numerator
@onready var denum2 = $VBoxContainer/Problem/Fraction2/VBoxContainer/Denominator
@onready var num2 = $VBoxContainer/Problem/Fraction2/VBoxContainer/Numerator
@onready var operator = $VBoxContainer/Problem/Operator/Label

# input numerator and denominator
@onready var num_input = $VBoxContainer/Problem/Answer/Fraction/Numerator/NumeratorAnswer
@onready var denum_input = $VBoxContainer/Problem/Answer/Fraction/Denominator/DenominatorAnswer

# label display for the result
@onready var result_display = $VBoxContainer/Result

@onready var submit_button = $VBoxContainer/Submit/SubmitAnswer

var user_answer: Array [int] = []
var correct_answer: Array [int] = []

func _ready() -> void:
	if Global.is_online:
		print("online mode")
		_load_questions()
	else: # else display hard coded values
		print("offline mode")
		Global.choose_question(questions)
		Global.randomize_questions(questions, current_chosen_questions, chosen_index_questions)
		_display_question()


func _load_questions():
	print("current quast is ", DialogueState.current_quest)
	QuestionsLoader.connect("questions_loaded", _on_questions_loaded)
	match DialogueState.current_quest:
		"saisai_wheelbarrow":
			QuestionsLoader.get_saisai_questions()
		"dead_robots":
			QuestionsLoader.get_robot_questions()

func _on_questions_loaded():
	match DialogueState.current_quest:
		"saisai_wheelbarrow":
			questions = QuestionsLoader.saisai_questions
		"dead_robots":
			questions = QuestionsLoader.robot_questions
	
	Global.choose_question(questions)
	Global.randomize_questions(questions, current_chosen_questions, chosen_index_questions)
	_display_question()


func _display_question():
	if question_index == current_chosen_questions.size():
		print("no more questions")
		_disable_questions()
		match DialogueState.current_quest:
			"saisai_wheelbarrow":
				Statistics.update_saisai_statistics(num_right_ans, num_wrong_ans)
			"dead_robots":
				Statistics.update_dead_robot_statistics(num_right_ans, num_wrong_ans)
		
	else :
		num_input.clear()
		denum_input.clear()
		
		num1.text = str(current_chosen_questions[question_index][0])
		denum1.text = str(current_chosen_questions[question_index][1])
		num2.text = str(current_chosen_questions[question_index][2])
		denum2.text = str(current_chosen_questions[question_index][3])
		operator.text = str(current_chosen_questions[question_index][4])

func _disable_questions():
	emit_signal("all_done")
	# THERE IS NO HELP BUTTON IN WATERLOGGED
	#help_button.visible = false
	#help_button.disabled = true
	
	num1.text = "0"
	denum1.text = "0"
	num2.text = "0"
	denum2.text = "0"
	operator.text = "0"
	
	num_input.editable = false
	denum_input.editable = false
	
	submit_button.disabled = true
	
	result_display.text = "You have answered all the questions"


func _on_submit_answer_pressed() -> void:
	correct_answer.clear()
	user_answer.clear()
	user_answer.append(int(num_input.text))
	user_answer.append(int(denum_input.text))

	match operator.text:
		"+" :
			_addition()
		"-" :
			_subtraction()

func _check_answer():
	if user_answer[1] == 0:
		result_display.text = "Zero can't be the denominator"
		num_wrong_ans += 1
		emit_signal("incorrect")
		return
	if user_answer[0] == correct_answer[0] and not user_answer[1] == correct_answer[1]:
		result_display.text = "Incorrect Denominator Try Again"
		num_wrong_ans += 1
		emit_signal("incorrect")
		return
	if not user_answer[0] == correct_answer[0] and user_answer[1] == correct_answer[1]:
		result_display.text = "Incorrect Numerator Try Again"
		num_wrong_ans += 1
		emit_signal("incorrect")
		return
	if not is_simplified():
		result_display.text = "Answer can still be simplified"
		num_right_ans += 1
		Global.is_simplified_tutorial = true
		return
	if user_answer[0] == correct_answer[0] and user_answer[1] == correct_answer[1]:
		result_display.text = "Correct Answer"
		num_right_ans += 1
		Global.is_simplified_tutorial = false
		emit_signal("correct")
		next()
	else:
		result_display.text = "Incorrect Answer"
		num_wrong_ans += 1
		emit_signal("incorrect")
	print(correct_answer)

func _addition():
	print("Addition")
	print(user_answer)
	
	var first_numerator = int(num1.text)
	var first_denominator = int(denum1.text)
	var second_numerator = int(num2.text)
	var second_denominator = int(denum2.text)
	
	var correct_numerator: int = 0
	var correct_denominator: int = 0
	
	# same denominator
	if first_denominator == second_denominator:
		correct_numerator = first_numerator + second_numerator
		correct_denominator = first_denominator
	
	# different denominator
	else:
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		correct_numerator = adjusted_first_numerator + adjusted_second_numerator
		correct_denominator = lcd
	
	var correct_fraction: Array = simplify_fraction(correct_numerator, correct_denominator)
	correct_answer.append(abs(correct_fraction[0]))
	correct_answer.append(abs(correct_fraction[1]))
	
	_check_answer()

func _subtraction():
	print("Subtraction")
	print(user_answer)
	
	var first_numerator = int(num1.text)
	var first_denominator = int(denum1.text)
	var second_numerator = int(num2.text)
	var second_denominator = int(denum2.text)
	
	var correct_numerator: int = 0
	var correct_denominator: int = 0
	
	# same denominator
	if first_denominator == second_denominator:
		correct_numerator = first_numerator - second_numerator
		correct_denominator = first_denominator
	
	# different denominator
	else:
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		correct_numerator = adjusted_first_numerator - adjusted_second_numerator
		correct_denominator = lcd
	
	var correct_fraction: Array = simplify_fraction(correct_numerator, correct_denominator)
	correct_answer.append(abs(correct_fraction[0]))
	correct_answer.append(abs(correct_fraction[1]))
	
	_check_answer()

func simplify_fraction(numerator: int, denominator: int):
	var gcd_value:int = GlobalFractionFunctions.gcd(numerator, denominator)
	var simplified_numerator = numerator / gcd_value
	var simplified_denominator = denominator / gcd_value
	var fraction: Array [int] = [simplified_numerator, simplified_denominator]
	return fraction

func is_simplified():
	var fraction: Array = simplify_fraction(user_answer[0], user_answer[1])
	if fraction[0] == user_answer[0] and fraction[1] == user_answer[1]:
		return true
	return false

func next():
	question_index += 1
	_display_question()


func _on_incorrect() -> void:
	Global.user_energy -= 1
