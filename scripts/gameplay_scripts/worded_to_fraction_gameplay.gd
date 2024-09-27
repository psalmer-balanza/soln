extends Control

# The user inputs all three fractions

# Add question here
@onready var question = $question/MarginContainer/Label

# FIRST FRACTION
@onready var first_fraction_numerator: LineEdit = $solution/first_fraction/VBoxContainer/MarginContainer/FirstFractionNumerator
@onready var first_fraction_denominator: LineEdit = $solution/first_fraction/VBoxContainer/MarginContainer2/FirstFractionDenominator
# SECOND FRACTION
@onready var second_fraction_numerator: LineEdit = $solution/second_fraction/VBoxContainer/MarginContainer/SecondFractionNumerator
@onready var second_fraction_denominator: LineEdit = $solution/second_fraction/VBoxContainer/MarginContainer2/SecondFractionDenominator
# ANSWER
@onready var numerator_answer: LineEdit = $solution/answer/VBoxContainer/MarginContainer/NumeratorAnswer
@onready var denominator_answer: LineEdit = $solution/answer/VBoxContainer/MarginContainer2/DenominatorAnswer

#@onready var first_fraction_given: RichTextLabel = $FirstFraction/FractionOne
#@onready var second_fraction_given: RichTextLabel = $SecondFraction/FractionTwo
@onready var display_answer: Label = $DisplayAnswer/UserAnswer

func _ready():
	print("ready")
	## Setting the text dynamically in the script
	## For zen to read from db
	#var fraction_text = "1 -- 4"
	#first_fraction_given.bbcode_text = fraction_text
	## For zen to read from db (second fraction) 
	#fraction_text = "3 -- 4"
	#second_fraction_given.bbcode_text = fraction_text

# Checker of proper and improper fraction for addition
func _on_submit_answer_button_down():
	# Retrieve input values
	var first_numerator = int(first_fraction_numerator.text)
	var first_denominator = int(first_fraction_denominator.text)
	var second_numerator = int(second_fraction_numerator.text)
	var second_denominator = int(second_fraction_denominator.text)
	var answer_numerator = int(numerator_answer.text)
	var answer_denominator = int(denominator_answer.text)

	# OS.alert('Please input your answer', 'Message Title')
	fraction_addition_checker(first_numerator, first_denominator, second_numerator, second_denominator, answer_numerator, answer_denominator)
	
func fraction_addition_checker(first_numerator: int, first_denominator: int, second_numerator: int, second_denominator: int, answer_numerator: int, answer_denominator: int):
	if first_denominator == second_denominator:
		# If denominators are the same, just add the numerators
		var added_numerator = first_numerator + second_numerator
		
		if added_numerator == answer_numerator and first_denominator == answer_denominator:
			# If the user's answer is correct
			display_answer.text = "Good job! Correct answer!"
		else:
			# If the user's answer is incorrect
			display_answer.text = "Try again."
	else:
		# If denominators are different, find the least common denominator (LCD)
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		
		# Adjust the numerators to the same denominator
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		
		var added_adjusted_numerator = adjusted_first_numerator + adjusted_second_numerator
		
		if added_adjusted_numerator == answer_numerator and lcd == answer_denominator:
			# If the user's answer is correct
			display_answer.text = "Good job! \nCorrect answer!"
		else:
			# If the user's answer is incorrect
			display_answer.text = "Try \nagain."

func return_to_world():
	print("Returning")
	get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
	
