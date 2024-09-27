extends Control

var fraction_questions = [
	[[1, 4], [3, 4]],  # First fraction
	[[1, 2], [1, 2]],  # Second fraction
	[[2, 5], [2, 5]],  # Third fraction
]
# Store multiple questions as pairs of numerators and denominators
func initiate_questions():
	if DialogueState.current_quest == "raket_stealing":
		fraction_questions = [
			[[1, 4], [3, 4]],  # First fraction
			[[35, 70], [15, 30]],  # Second fraction
			[[2, 5], [2, 5]],  # Third fraction
		]
	elif DialogueState.current_quest == "dead_robot":
		print("Doing dead robot questions")
		fraction_questions = [
			[[1, 4], [3, 4]],  # First fraction
			[[2, 3], [1, 3]],  # Second fraction
			[[2, 5], [2, 5]],  # Third fraction
		]

var current_question_index = 0  # Track which question the player is on

@onready var numerator_input: LineEdit = $Answer/NumeratorAnswer
@onready var denominator_input: LineEdit = $Answer/DenominatorAnswer
@onready var first_fraction_given: RichTextLabel = $FirstFraction/FractionOne
@onready var second_fraction_given: RichTextLabel = $SecondFraction/FractionTwo
@onready var display_answer: RichTextLabel = $DisplayAnswer/UserAnswer

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
	first_fraction_given.bbcode_text = "%d -- %d" % [first_fraction[0], first_fraction[1]]
	second_fraction_given.bbcode_text = "%d -- %d" % [second_fraction[0], second_fraction[1]]

# Function called when the submit answer button is pressed
func _on_submit_answer_button_down():
	# Split the string using the right delimiter " -- "
	var first_fraction_split = first_fraction_given.text.split(" -- ")
	var second_fraction_split = second_fraction_given.text.split(" -- ")
	
	var first_numerator = int(first_fraction_split[0])
	var first_denominator = int(first_fraction_split[1])
	var second_numerator = int(second_fraction_split[0])
	var second_denominator = int(second_fraction_split[1])

	# Check the answer for the current fraction
	fraction_addition_checker(first_numerator, first_denominator, second_numerator, second_denominator)

# Function to check the fraction addition answer
func fraction_addition_checker(first_numerator: int, first_denominator: int, second_numerator: int, second_denominator: int):
	if first_denominator == second_denominator:
		var added_numerator = first_numerator + second_numerator
		
		if added_numerator == int(numerator_input.text) and first_denominator == int(denominator_input.text):
			$AnimationPlayer.play("good_answer")
			display_answer.text = "Good job! \nCorrect answer!"
			next_question_or_finish()  # Move to the next question or finish the exercise
		else:
			display_answer.text = "Try again."
	else: # DIFFERENT DANAMANATORS
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		var added_adjusted_numerator = adjusted_first_numerator + adjusted_second_numerator
		
		if added_adjusted_numerator == int(numerator_input.text) and lcd == int(denominator_input.text):
			$AnimationPlayer.play("good_answer")
			display_answer.text = "Good job! \nCorrect answer!"
			next_question_or_finish()  # Move to the next question or finish the exercise
		else:
			display_answer.text = "Try again."

# Function to either move to the next question or finish
func next_question_or_finish():
	if current_question_index < fraction_questions.size() - 1:
		current_question_index += 1  # Move to the next question
		display_current_question()  # Update the UI with the next question
	else:
		# If all questions are answered, return to the world
		display_answer.text = "All questions completed! Returning to the world..."
		return_to_world()

# Function to return to the world scene
func return_to_world():
	print("Returning")
	get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
