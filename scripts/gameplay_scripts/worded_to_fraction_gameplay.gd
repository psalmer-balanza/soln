extends Node2D

# Store multiple questions as pairs of numerators and denominators
var fraction_questions = [
	[[1, 4], [3, 4]],  # First question fractions
	[[5, 7], [2, 7]],  # Second question fractions
	[[2, 5], [2, 5]],  # Third question fractions
	]
var question_texts = [
	"Combine these fractions: 1/4 + 3/4.",
	"Find the sum of these fractions: 5/7 + 2/7.",
	"Add these fractions: 2/5 + 2/5."
	]  # List to store question context text for each round
var current_question_index = 0  # Track which question the player is on

# Nodes for user inputs and display
@onready var first_fraction_numerator: LineEdit = $solution/first_fraction/VBoxContainer/MarginContainer/FirstFractionNumerator
@onready var first_fraction_denominator: LineEdit = $solution/first_fraction/VBoxContainer/MarginContainer2/FirstFractionDenominator
@onready var second_fraction_numerator: LineEdit = $solution/second_fraction/VBoxContainer/MarginContainer/SecondFractionNumerator
@onready var second_fraction_denominator: LineEdit = $solution/second_fraction/VBoxContainer/MarginContainer2/SecondFractionDenominator
@onready var numerator_answer: LineEdit = $solution/answer/VBoxContainer/MarginContainer/NumeratorAnswer
@onready var denominator_answer: LineEdit = $solution/answer/VBoxContainer/MarginContainer2/DenominatorAnswer
@onready var display_answer: Label = $DisplayAnswer/UserAnswer
@onready var question_label: Label = $question/MarginContainer/Label  # Label to display question text

@onready var npc_sprite = $NPC_Sprites
@onready var current_npc = DialogueState.current_npc

func _ready():
	print("ready")
	npc_active()
	initiate_questions()
	display_current_question()

func npc_active():
	npc_sprite.play(current_npc)
	if current_npc == "saisai":
		npc_sprite.play("saisai")
	elif current_npc == "raket":
		npc_sprite.play("raket")
		DialogueState.raket_house_quest_complete = true
	elif current_npc == "old_peculiar":
		npc_sprite.play("old_robot")
	elif current_npc == "masked_figure":
		npc_sprite.play("masked_figure")
	else:
		print(current_npc)
		print("no active npc")

# Initialize questions and context texts based on the current quest
func initiate_questions():
	print(DialogueState.current_quest)
	if DialogueState.current_quest == "raket_stealing":
		print("Current quest is raket stealing")
		fraction_questions = [
			[[1, 4], [3, 4]],  # First question fractions
			[[3, 7], [3, 7]],  # Second question fractions
			[[2, 5], [2, 5]],  # Third question fractions
		]
		question_texts = [
			"Combine these fractions: 1/4 + 3/4.",
			"Find the sum of these fractions: 3/7 + 3/7.",
			"Add these fractions: 2/5 + 2/5."
		]
	elif DialogueState.current_quest == "dead_robot":
		print("Current quest is dead robot")
		fraction_questions = [
			[[1, 4], [3, 4]],  # First question fractions
			[[2, 3], [1, 3]],  # Second question fractions
			[[2, 5], [2, 5]],  # Third question fractions
		]
		question_texts = [
			"What is 1/4 + 3/4?",
			"Add these fractions: 2/3 + 1/3.",
			"Combine these: 2/5 + 2/5."
		]
	elif DialogueState.current_quest == "raket_house":
		print("Current quest is raket house")
		fraction_questions = [
			[[1, 2], [1, 2]],  # First question fractions
			[[2, 3], [1, 3]],  # Second question fractions
			[[2, 5], [2, 5]],  # Third question fractions
		]
		question_texts = [
			"What is 1/2 + 1/2?",
			"Add these fractions: 2/3 + 1/3.",
			"Combine these: 2/5 + 2/5."
		]
	else:
		print("No quest?")

# Display the current question and update the label text
func display_current_question():
	print(fraction_questions[current_question_index])
	var current_question = fraction_questions[current_question_index]
	var first_fraction = current_question[0]
	var second_fraction = current_question[1]
	
	# Set the text for the fractions to be input by the player
	first_fraction_numerator.text = ""
	first_fraction_denominator.text = ""
	second_fraction_numerator.text = ""
	second_fraction_denominator.text = ""
	numerator_answer.text = ""
	denominator_answer.text = ""
	
	# Set the question text for the current round
	question_label.text = question_texts[current_question_index]

# Called when the submit answer button is pressed
func _on_submit_answer_button_down():
	# Retrieve input values
	var first_numerator = int(first_fraction_numerator.text)
	var first_denominator = int(first_fraction_denominator.text)
	var second_numerator = int(second_fraction_numerator.text)
	var second_denominator = int(second_fraction_denominator.text)
	var answer_numerator = int(numerator_answer.text)
	var answer_denominator = int(denominator_answer.text)

	# Validate the inputted fractions against the question
	if not input_matches_question(first_numerator, first_denominator, second_numerator, second_denominator):
		# $AnimationPlayer.play("wrong_answer_saisai")
		display_answer.text = "Incorrect fractions. Please input the correct fractions."
		return

	# Check the user's input against the current question
	fraction_addition_checker(first_numerator, first_denominator, second_numerator, second_denominator, answer_numerator, answer_denominator)

# Validate if inputted fractions match the current question's fractions
func input_matches_question(first_numerator: int, first_denominator: int, second_numerator: int, second_denominator: int) -> bool:
	var current_question = fraction_questions[current_question_index]
	var expected_first_fraction = current_question[0]
	var expected_second_fraction = current_question[1]
	
	return first_numerator == expected_first_fraction[0] and first_denominator == expected_first_fraction[1] and second_numerator == expected_second_fraction[0] and second_denominator == expected_second_fraction[1]


# Check the fraction addition answer
func fraction_addition_checker(first_numerator: int, first_denominator: int, second_numerator: int, second_denominator: int, answer_numerator: int, answer_denominator: int):
	if first_denominator == second_denominator:
		# If denominators are the same, just add the numerators
		var added_numerator = first_numerator + second_numerator
		
		if added_numerator == answer_numerator and first_denominator == answer_denominator:
			
			display_answer.text = "Good job! Correct answer!"
			next_question_or_finish()  # Move to the next question or finish
			if DialogueState.current_npc == "old_peculiar":
				$AnimationPlayer.play("spin")
				await $AnimationPlayer.animation_finished
				#$AnimationPlayer.play("idle_ropbot")
			$AnimationPlayer.play("spin")
			await $AnimationPlayer.animation_finished
			#$AnimationPlayer.play("idle_saisai")
		else:
			#$AnimationPlayer.play("wrong_answer_saisai")
			#await $AnimationPlayer.animation_finished
			#$AnimationPlayer.play("idle_saisai")
			display_answer.text = "Try again."
	else:
		# If denominators are different, find the least common denominator (LCD)
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		
		# Adjust the numerators to the same denominator
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		var added_adjusted_numerator = adjusted_first_numerator + adjusted_second_numerator
		
		if added_adjusted_numerator == answer_numerator and lcd == answer_denominator:
			$AnimationPlayer.play("spin")
			display_answer.text = "Good job! \nCorrect answer!"
			next_question_or_finish()  # Move to the next question or finish
		else:
			#$AnimationPlayer.play("wrong_answer_saisai")
			display_answer.text = "Try \nagain."

# Move to the next question or finish the exercise
func next_question_or_finish():
	if current_question_index < fraction_questions.size() - 1:
		current_question_index += 1  # Move to the next question
		display_current_question()  # Update the UI with the next question
	else:
		# If all questions are answered, return to the world
		display_answer.text = "All questions completed! Returning to the world..."
		return_to_world()

# Return to the world scene
func return_to_world():
	print("Returning")
	get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
