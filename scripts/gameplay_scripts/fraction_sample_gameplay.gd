extends Control

@onready var numerator_input: LineEdit = $Answer/NumeratorAnswer
@onready var denominator_input: LineEdit = $Answer/DenominatorAnswer
@onready var first_fraction_given: RichTextLabel = $FirstFraction/FractionOne
@onready var second_fraction_given: RichTextLabel = $SecondFraction/FractionTwo
@onready var display_answer: RichTextLabel = $DisplayAnswer/UserAnswer

func _ready():
	# Setting the text dynamically in the script
	# For zen to read from db
	var fraction_text = "1 -- 4"
	first_fraction_given.bbcode_text = fraction_text
	# For zen to read from db (second fraction) 
	fraction_text = "3 -- 4"
	second_fraction_given.bbcode_text = fraction_text

# Checker of proper and improper fraction for addition
func _on_submit_answer_button_down():
	# Split the string using the right delimiter "\n--\n"
	## Modify to check if there is no input
	#GlobalGameState.xalert("No Input", "Please input your answer")
	var first_fraction_split = first_fraction_given.text.split(" -- ")
	var second_fraction_split = second_fraction_given.text.split(" -- ")
	
	var first_numerator = int(first_fraction_split[0])
	var first_denominator = int(first_fraction_split[1])
	var second_numerator = int(second_fraction_split[0])
	var second_denominator = int(second_fraction_split[1])

	# OS.alert('Please input your answer', 'Message Title')

	## Check if given problem is a proper fraction
	if first_denominator == second_denominator:
		var added_numerator = first_numerator + second_numerator
		
		if added_numerator == int(numerator_input.text) && first_denominator == int(denominator_input.text): 
			# Show this if the student's answer is correct
			display_answer.text = "Good job! \nCorrect answer!"
		else:
			# Show this if the student's answer is incorrect
			display_answer.text = "Try \nagain."
			# For zen
			# some scorer thing here that adds to the leaderboard
	else:
		# If given problem is improper fraction
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		
		# Adjust numerators to the same denominator
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		
		
		var added_adjusted_numerator = adjusted_first_numerator + adjusted_second_numerator
		
		if added_adjusted_numerator == int(numerator_input.text) && lcd == int(denominator_input.text):
			# Show this if the student's answer is correct
			display_answer.text = "Good job! \nCorrect answer!"
		else:
			# Show this if the student's answer is incorrect
			display_answer.text = "Try \nagain."
