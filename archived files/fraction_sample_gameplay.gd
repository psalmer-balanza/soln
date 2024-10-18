#extends Control
#
#@onready var correct_ans_count = 0
#@onready var wrong_ans_count = 0
#@onready var unsimplified_ans_count = 0
#@onready var correct_answer_sfx: AudioStreamPlayer = $CorrectAnswerSFX
#@onready var wrong_answer_sfx: AudioStreamPlayer = $WrongAnswerSFX
#
#var current_player_username = PlayerState.player_username
#var current_minigame_id
#
#var fraction_questions = [
	#[4, 3, 1, 3],  # First fraction
	#[3, 2, 1, 2],  # Second fraction
	#[3, 2, 2, 5],  # Third fraction
#]
#
## Store multiple questions as pairs of numerators and denominators
#func initiate_questions():
	#
	#GetFractions.connect("questions_loaded", _on_questions_loaded)
	#if DialogueState.current_quest == "saisai_rock":
		#GetFractions.post_data["MinigameID"] = 1
		#current_minigame_id = GetFractions.post_data["MinigameID"]
		#GetFractions.post()
		#fraction_questions = GetFractions.fraction_questions
	#elif DialogueState.current_quest == "dead_robots":
		#print("Doing dead robot questions")
		#GetFractions.post_data["MinigameID"] = 2
		#current_minigame_id = GetFractions.post_data["MinigameID"]
		#GetFractions.post()
		#fraction_questions = GetFractions.fraction_questions
		#
#var current_question_index = 0  # Track which question the player is on
#
#@onready var numerator_input: LineEdit = $addition/VBoxContainer/HBoxContainer/answer_fraction/fraction/numerator/NumeratorAnswer
#@onready var denominator_input: LineEdit = $addition/VBoxContainer/HBoxContainer/answer_fraction/fraction/denominator/DenominatorAnswer
#@onready var first_num_label: Label = $addition/VBoxContainer/HBoxContainer/first_fraction/fraction/numerator
#@onready var first_denum_label: Label = $addition/VBoxContainer/HBoxContainer/first_fraction/fraction/denominator
#@onready var second_num_label: Label = $addition/VBoxContainer/HBoxContainer/second_fraction/fraction/numerator
#@onready var second_denum_label: Label = $addition/VBoxContainer/HBoxContainer/second_fraction/fraction/denominator
#@onready var display_answer: Label = $addition/VBoxContainer/result
#@onready var submit_answer = $submit/SubmitAnswer
#@onready var http_request: HTTPRequest = HTTPRequest.new()
#
#var statistics_url = "http://localhost:3000/game/updatestatistics"
#var first_num: int
#var first_denum: int
#var second_num: int
#var second_denum: int
#var is_simplified = false
#
#func _ready():
	#initiate_questions()
	#print("Current questline is: ", DialogueState.current_quest)
	#if DialogueState.current_quest == "dead_robots":
		#$AnimationPlayer.play("idle_robot")
	#elif DialogueState.current_quest == "saisai_rock":
		#$AnimationPlayer.play("default")
	## Create an HTTP request node and connect its completion signal.
	#add_child(http_request)
	#http_request.request_completed.connect(self._http_request_completed)
	#
#func _on_questions_loaded():
	##if DialogueState.current_quest == "dead_robots":
	###$AnimatedSprite2D.play("idle_robot")display_current_question()
	#fraction_questions = GetFractions.fraction_questions
	#display_current_question()
#
## Function to display the current question
#func display_current_question():
	#var current_question = fraction_questions[current_question_index]
	#
	## Set the text for the first and second fractions
	#first_num = current_question[0]
	#first_denum = current_question[1]
	#second_num = current_question[2]
	#second_denum = current_question[3]
	#
	## display fractions
	#first_num_label.text = str(first_num)
	#first_denum_label.text = str(first_denum)
	#second_num_label.text = str(second_num)
	#second_denum_label.text = str(second_denum)
#
## Function to check the fraction addition answer
#func fraction_addition_checker(first_numerator: int, first_denominator: int, second_numerator: int, second_denominator: int):
	#if first_denominator == second_denominator:
		#var added_numerator = first_numerator + second_numerator
		#
		#if is_simplified:
			#if check_simplified_form(added_numerator, first_denominator):
				#if DialogueState.current_quest == "dead_robots":
					#correct_answer_robot()
				#elif DialogueState.current_quest == "saisai_rock":
					#correct_answer_saisai()
				#display_answer.text = "Nice! \nCorrect simplified form."
				#is_simplified = false
				##Checker for correct
				#correct_ans_count += 1
				#next_question_or_finish()  # Move to the next question or finish the exercise
#
			#else:
				#display_answer.text = "Try again. \nCheck your GCD value."
				#is_simplified = true
				#if DialogueState.current_quest == "dead_robots":
					#wrong_answer_robot()
				#elif DialogueState.current_quest == "saisai_rock":
					#wrong_answer_saisai()
				##Checker for wrong ans
				#wrong_ans_count += 1
				#
		#elif added_numerator == int(numerator_input.text) and first_denominator == int(denominator_input.text):
			#if DialogueState.current_quest == "dead_robots":
				#correct_answer_robot()
			#elif DialogueState.current_quest == "saisai_rock":
				#correct_answer_saisai()
				#
			#if GlobalFractionFunctions.check_lowest_form(added_numerator, int(denominator_input.text)):
				#if DialogueState.current_quest == "dead_robots":
					#correct_answer_robot()
				#elif DialogueState.current_quest == "saisai_rock":
					#correct_answer_saisai()
				#display_answer.text = "Good job! \nBut answer can be simplified."
				#is_simplified = true
				##Checker for unsimplified ans
				#unsimplified_ans_count += 1
			#else:
				#display_answer.text = "Great job! \nCorrect answer!"
				##Checker for correct
				#correct_ans_count += 1
				#next_question_or_finish()  # Move to the next question or finish the exercise
				#
		#elif check_simplified_form(added_numerator, first_denominator) and !is_simplified:
			#if DialogueState.current_quest == "dead_robots":
				#correct_answer_robot()
			#elif DialogueState.current_quest == "saisai_rock":
				#correct_answer_saisai()
			#
			#display_answer.text = "Advance thinking! \nYou entered its simplified form."
			##Checker for correct
			#correct_ans_count += 1
			#next_question_or_finish()  # Move to the next question or finish the exercise
	#
		#else:
			#if DialogueState.current_quest == "dead_robots":
				#wrong_answer_robot()
			#elif DialogueState.current_quest == "saisai_rock":
				#wrong_answer_saisai()
			##Checker for wrong ans
			#wrong_ans_count += 1
			#display_answer.text = "Try again. Check your\n numerator or denominator"
			#
	#else:  # DIFFERENT DENOMINATORS
		#var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		#var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		#var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		#var added_adjusted_numerator = adjusted_first_numerator + adjusted_second_numerator
		#
		#if is_simplified:
			#if check_simplified_form(added_adjusted_numerator, lcd):
				#display_answer.text = "Nice! \nCorrect simplified form."
				#if DialogueState.current_quest == "dead_robots":
					#correct_answer_robot()
				#elif DialogueState.current_quest == "saisai_rock":
					#correct_answer_saisai()
				#is_simplified = false
				##Checker for correct
				#correct_ans_count += 1
				#next_question_or_finish()  # Move to the next question or finish the exercise
			#
			#else:
				#display_answer.text = "Try again. \nCheck your GCD value."
				#if DialogueState.current_quest == "dead_robots":
					#wrong_answer_robot()
				#elif DialogueState.current_quest == "saisai_rock":
					#wrong_answer_saisai()
				#is_simplified = true
				##Checker for wrong ans
				#wrong_ans_count += 1
	#
		#elif added_adjusted_numerator == int(numerator_input.text) and lcd == int(denominator_input.text):
			#if DialogueState.current_quest == "dead_robots":
				#correct_answer_robot()
			#elif DialogueState.current_quest == "saisai_rock":
				#correct_answer_saisai()
#
			#if GlobalFractionFunctions.check_lowest_form(added_adjusted_numerator, lcd): 
				#display_answer.text = "Good job! \nBut answer can be simplified."
				#is_simplified = true
				##Checker for unsimplified ans
				#unsimplified_ans_count += 1
			#else:
				#display_answer.text = "Great job! \nCorrect answer!"
				##Checker for correct
				#correct_ans_count += 1
				#next_question_or_finish()  # Move to the next question or finish the exercise
				#
		#elif check_simplified_form(added_adjusted_numerator, lcd) and !is_simplified:
			#display_answer.text = "Advance thinking! \nYou entered its simplified form."
			#if DialogueState.current_quest == "dead_robots":
				#correct_answer_robot()
			#elif DialogueState.current_quest == "saisai_rock":
				#correct_answer_saisai()
			##Checker for correct
			#correct_ans_count += 1
			#next_question_or_finish()  # Move to the next question or finish the exercise
			#
		#else:
			#if DialogueState.current_quest == "dead_robots":
				#wrong_answer_robot()
			#elif DialogueState.current_quest == "saisai_rock":
				#wrong_answer_saisai()
			#display_answer.text = "Try again."
			##Checker for wrong ans
			#wrong_ans_count += 1
#
## Function to check for the simplified answer
#func check_simplified_form(correct_numerator: int, correct_denominator: int) -> bool:
	#var gcd_value: int = GlobalFractionFunctions.gcd(correct_numerator, correct_denominator)
#
	#var simplified_numerator = correct_numerator / gcd_value
	#var simplified_denominator = correct_denominator / gcd_value
#
	#if simplified_numerator == int(numerator_input.text) and simplified_denominator == int(denominator_input.text):
			#return true
		#
	#return false
#
## Function to either move to the next question or finish
#func next_question_or_finish():
	#if current_question_index < fraction_questions.size() - 1:
		#current_question_index += 1  # Move to the next question
		#numerator_input.clear()
		#denominator_input.clear()
		#display_current_question()  # Update the UI with the next question
		#
	#else:
		## If all questions are answered, return to the world
		## compile and send to db for zen/julliard
		## dialogue scene here maybe?
		#print("Simple addition correct answers: ", correct_ans_count)
		#print("Simple addition wrong answers: ", wrong_ans_count)
		#var total_ans_count = correct_ans_count + wrong_ans_count
		#print("Simple addition total attempts: ", total_ans_count)
		#print("Simple addition unsimplified answers: ", unsimplified_ans_count)
		#print("What I need to do now is map each of these attempts per question,
		#connect to question IDs too")
		#print("Current minigame id: ", current_minigame_id)
		#numerator_input.editable = false
		#denominator_input.editable = false
		#submit_answer.disabled = true
		#display_answer.text = "All questions completed!\nReturning to the world..."
		#await get_tree().create_timer(3.0).timeout
		#
		#var statistics_data = {
			#"username": current_player_username,
			#"minigame_id": current_minigame_id,
			#"num_correct_ans": correct_ans_count,
			#"num_wrong_ans": wrong_ans_count,
			#"total_attempts": total_ans_count,
			#"num_unsimplified_ans": unsimplified_ans_count,
		#}
		#
		#var json_body = JSON.stringify(statistics_data)
		#print(json_body)
		#var headers = ["Content-type: application/json"]
		#
		## Perform a POST request. The URL below returns JSON as of writing.
		#http_request.request(statistics_url, headers, HTTPClient.METHOD_POST, json_body)
#
## Called when the HTTP request is completed.
#func _http_request_completed(result, response_code, headers, body):
	#if response_code == 200:
		#var json = JSON.new()
		#var error = json.parse(body.get_string_from_utf8())
		#if error == OK:
			#var response = json.get_data()
			## RESPONSE IS RETURNING FALSE EVEN THOUGH THE LOGIN IS SUCCESSFUL
			#if !response.success:
				#print("statistics updated")
				#return_to_world()
			#else:
				#print("Login failed")
		#else:
			#print("Failed to parse JSON")
	#else:
		#print("HTTP request failed with code:", response_code)
#
#
## Function to return to the world scene
#func return_to_world():
	#print("Returning")
	#get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
#
#func _on_submit_answer_pressed() -> void:
	## Validate the numerator and denominator inputs
	#if !is_valid_integer(numerator_input.text) or !is_valid_integer(denominator_input.text):
		#display_answer.text = "Please enter valid numbers."
		#print("Invalid input detected: Non-integer value entered.")
		#return  # Exit the function if input is invalid
	#
	## Check if the inputs are empty
	#if numerator_input.text == "" or denominator_input.text == "":
		#display_answer.text = "Please fill in both the numerator and denominator."
		#print("Empty input detected.")
		#return  # Exit the function if any input is empty
	#
	## Convert text to integers and proceed to check the answer
	#var input_numerator = int(numerator_input.text)
	#var input_denominator = int(denominator_input.text)
#
	#print("Valid input: ", input_numerator, "/", input_denominator)
#
	## Call the fraction checker with validated input
	#fraction_addition_checker(first_num, first_denum, second_num, second_denum)
#
## Helper function to check if a string is a valid integer
#func is_valid_integer(value: String) -> bool:
	## Try converting the string to an integer, and return true if successful
	#var number = value.to_int()
	#return str(number) == value.strip_edges()
#
#func _on_button_pressed() -> void:
	#return_to_world()
	#
#func correct_answer_saisai() -> void:
	#correct_answer_sfx.play()
	#$AnimationPlayer.play("correct_answer_saisai")
	#await $AnimationPlayer.animation_finished
	#$AnimationPlayer.play("saisai_idle")
#
#func wrong_answer_saisai() -> void:
	#wrong_answer_sfx.play()
	#$AnimationPlayer.play("wrong_answer_saisai")
	#await $AnimationPlayer.animation_finished
	#$AnimationPlayer.play("saisai_idle")
#
#func correct_answer_robot() -> void:
	#correct_answer_sfx.play()
	#$AnimationPlayer.play("right_answer_robot")
	#await $AnimationPlayer.animation_finished
	#$AnimationPlayer.play("robot_idle")
#
#func wrong_answer_robot() -> void:
	#wrong_answer_sfx.play()
	#$AnimationPlayer.play("wrong_answer_robot")
	#await $AnimationPlayer.animation_finished
	#$AnimationPlayer.play("robot_idle")
	#
