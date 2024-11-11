# GdUnit generated TestSuite
class_name FractionAdditionGameplayTest
extends 'res://scripts/gameplay_scripts/fraction_problem.gd'

@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

func _check_answer():
	print("Mock _check_answer called - Pass")

func _next():
	print(" Mock _next called - Pass ")

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

func _check_answer_original():
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
		Global.is_simplified_tutorial = true
		return
	if user_answer[0] == correct_answer[0] and user_answer[1] == correct_answer[1]:
		result_display.text = "Correct Answer"
		num_right_ans += 1
		Global.is_simplified_tutorial = false
		emit_signal("correct")
		if DialogueState.current_quest == "water_room_1" or DialogueState.current_quest == "water_room_2" or DialogueState.current_quest == "water_room_3" or DialogueState.current_quest == "meeting_chip":
			$"../CorrectSFX".play()
		if Global.is_online:
			Statistics.post_fraction_statistics(PlayerState.classroom_id, PlayerState.student_id, current_chosen_questions[question_index][5], QuestionsLoader.minigame_id, num_right_ans, num_wrong_ans)
		next()
	else:
		result_display.text = "Incorrect Answer"
		num_wrong_ans += 1
		emit_signal("incorrect")
	print(correct_answer)
	
