extends Control

var fraction_questions = [
	[[2, 3], [1, 3]],  # First fraction
	[[3, 2], [1, 2]],  # Second fraction
	[[3, 2], [2, 5]],  # Third fraction
]

# Store multiple questions as pairs of numerators and denominators
func initiate_questions():
	if DialogueState.current_quest == "saisai_rock":
		fraction_questions = [
			[[5, 4], [3, 4]],  # First fraction
			[[7, 10], [1, 5]],  # Second fraction
			[[9, 5], [4, 5]],  # Third fraction
		]
	elif DialogueState.current_quest == "dead_robot":
		print("Doing dead robot questions")
		fraction_questions = [
			[[3, 4], [1, 4]],  # First fraction
			[[5, 6], [1, 3]],  # Second fraction
			[[7, 5], [2, 5]],  # Third fraction
		]

var current_question_index = 0  # Track which question the player is on

@onready var numerator_input: LineEdit = $addition/VBoxContainer/HBoxContainer/answer_fraction/fraction/numerator/NumeratorAnswer
@onready var denominator_input: LineEdit = $addition/VBoxContainer/HBoxContainer/answer_fraction/fraction/denominator/DenominatorAnswer
@onready var first_num_label: Label = $addition/VBoxContainer/HBoxContainer/first_fraction/fraction/numerator
@onready var first_denum_label: Label = $addition/VBoxContainer/HBoxContainer/first_fraction/fraction/denominator
@onready var second_num_label: Label = $addition/VBoxContainer/HBoxContainer/second_fraction/fraction/numerator
@onready var second_denum_label: Label = $addition/VBoxContainer/HBoxContainer/second_fraction/fraction/denominator
@onready var display_answer: Label = $addition/VBoxContainer/result

var first_num: int
var first_denum: int
var second_num: int
var second_denum: int
var is_simplified = false

func _ready():
	# Start by displaying the first question
	print("Current questline is: ", DialogueState.current_quest)
	initiate_questions()
	display_current_question()

# Function to display the current question
func display_current_question():
	var current_question = fraction_questions[current_question_index]
	var first_fraction = current_question[0]
	var second_fraction = current_question[1]
	
	# Set the text for the first and second fractions
	first_num = first_fraction[0]
	first_denum = first_fraction[1]
	second_num = second_fraction[0]
	second_denum = second_fraction[1]
	
	# display fractions
	first_num_label.text = str(first_num)
	first_denum_label.text = str(first_denum)
	second_num_label.text = str(second_num)
	second_denum_label.text = str(second_denum)

# Function to check the fraction subtraction answer
func fraction_subtraction_checker(first_numerator: int, first_denominator: int, second_numerator: int, second_denominator: int):
	if first_denominator == second_denominator:
		var added_numerator = first_numerator + second_numerator
		
		if is_simplified:
			if check_simplified_form(added_numerator, first_denominator):
				display_answer.text = "Nice! \nCorrect simplified form."
				is_simplified = false
				next_question_or_finish()  # Move to the next question or finish the exercise
			else:
				display_answer.text = "Try again! \nCheck your GCD value."
				is_simplified = true
				
		elif added_numerator == int(numerator_input.text) and first_denominator == int(denominator_input.text):
			$AnimationPlayer.play("correct_answer_saisai")
			await $AnimationPlayer.animation_finished
			display_answer.text = "Good job! \nCorrect answer!"
			if GlobalFractionFunctions.check_lowest_form(added_numerator, int(denominator_input.text)): 
				display_answer.text = "Good job! \nBut answer can be simplified."
				is_simplified = true
			else:
				next_question_or_finish()  # Move to the next question or finish the exercise
		else:
			$AnimationPlayer.play("wrong_answer_saisai")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.play("saisai_idle")
			display_answer.text = "Try again."
			
	else:  # DIFFERENT DENOMINATORS
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		var added_adjusted_numerator = adjusted_first_numerator + adjusted_second_numerator
		
		if is_simplified:
			if check_simplified_form(added_adjusted_numerator, lcd):
				display_answer.text = "Nice! \nCorrect simplified form."
				is_simplified = false
				next_question_or_finish()  # Move to the next question or finish the exercise
			else:
				display_answer.text = "Try again! \nCheck your GCD value."
				is_simplified = true
	
		elif added_adjusted_numerator == int(numerator_input.text) and lcd == int(denominator_input.text):
			$AnimationPlayer.play("correct_answer_saisai")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.play("saisai_idle")
			display_answer.text = "Good job! \nCorrect answer!"
			if GlobalFractionFunctions.check_lowest_form(added_adjusted_numerator, lcd): 
				display_answer.text = "Good job! \nBut answer can be simplified."
				is_simplified = true
			else:
				next_question_or_finish()  # Move to the next question or finish the exercise
		else:
			$AnimationPlayer.play("wrong_answer_saisai")
			await $AnimationPlayer.animation_finished
			$AnimationPlayer.play("saisai_idle")
			display_answer.text = "Try again."

# Function to check for the simplified answer
func check_simplified_form(correct_numerator: int, correct_denominator: int) -> bool:
	var gcd_value: int = GlobalFractionFunctions.gcd(correct_numerator, correct_denominator)

	var simplified_numerator = correct_numerator / gcd_value
	var simplified_denominator = correct_denominator / gcd_value

	if simplified_numerator == int(numerator_input.text) and simplified_denominator == int(denominator_input.text):
			return true
		
	return false

# Function to either move to the next question or finish
func next_question_or_finish():
	if current_question_index < fraction_questions.size() - 1:
		current_question_index += 1  # Move to the next question
		numerator_input.clear()
		denominator_input.clear()
		display_current_question()  # Update the UI with the next question
	else:
		# If all questions are answered, return to the world
		display_answer.text = "All questions completed! Returning to the world..."
		return_to_world()

# Function to return to the world scene
func return_to_world():
	print("Returning")
	get_tree().change_scene_to_file("res://scenes/levels/test_floor1/test_floor2.tscn")

func _on_submit_answer_pressed() -> void:
	fraction_subtraction_checker(first_num, first_denum, second_num, second_denum)

func _on_button_pressed() -> void:
	return_to_world()
