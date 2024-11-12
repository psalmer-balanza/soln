extends Control

# numerator and denominator of first and second fraction
@onready var num1_text = $"../../FractionProblem/VBoxContainer/Problem/Fraction1/VBoxContainer/Numerator"
@onready var denum1_text = $"../../FractionProblem/VBoxContainer/Problem/Fraction1/VBoxContainer/Denominator"
@onready var num2_text = $"../../FractionProblem/VBoxContainer/Problem/Fraction2/VBoxContainer/Numerator"
@onready var denum2_text = $"../../FractionProblem/VBoxContainer/Problem/Fraction2/VBoxContainer/Denominator"


# Tutorials scenes
@onready var quick_tutorial = $"../QuickTutorial"
@onready var quick_tutorial_3 = $"../QuickTutorial3"
@onready var quick_tutorial_9 = $"../QuickTutorial9"
@onready var label_4 = $"../QuickTutorial4/Content/Label"
@onready var label_5 = $"../QuickTutorial5/Content/Label"
@onready var label_6 = $"../QuickTutorial6/Content/Label"
@onready var label_7 = $"../QuickTutorial7/Content/Label"
@onready var label_8 = $"../QuickTutorial8/Content/Label"
@onready var label_9 = $"../QuickTutorial9/Content/Label"


# Tutorial for same and different denominators
func _on_button_down():
		var num1 = num1_text.text
		var denum1 = denum1_text.text
		var num2 = num2_text.text
		var denum2 = denum2_text.text
		
		# Answer can be simplified
		if Global.is_simplified_tutorial:
			quick_tutorial_9.visible = true
			label_9.text = "To simplify, identify the Greatest Common Divisor (GCD) that the numerator and denominator can be divided with."
			return
		
		# Tutorial for same denominator
		if denum1 == denum2:
			quick_tutorial.visible = true
			
		# Tutorial for different denominator
		elif denum1 != denum2:
			quick_tutorial_3.visible = true
			var lcd = GlobalFractionFunctions.get_lcd(int(denum1), int(denum2))
			var balanced_values = GlobalFractionFunctions.balance_num_and_denum(int(num1), int(denum1), int(num2), int(denum2), lcd)
		
			label_4.text = "To to this we need a common denominator that both fractions share. In this example, " + str(denum1) + " and " + str(denum2) + " has an LCD of " + str(lcd) + "."
			
			# Both fractions needs to be adjusted
			if str(denum1) != str(lcd) and str(denum2) != str(lcd):
				label_5.text = "After, check the 1st fraction if it needs to change. In this example, denominator " + str(denum1)+ " \nneeds to multiplied by " + str(balanced_values["balance_multiplier_1st"]) + " to get its LCM form. (" + str(lcd) + ")"
				label_6.text = "So, we change its numerator " + str(num1) + " by multiplying it by the same number you multiplied your denominator which is " + str(balanced_values["balance_multiplier_1st"]) + "."
				label_7.text = "Then, check the 2nd fraction if it needs to change. In this example, denominator " + str(denum2)+ " \nneeds to multiplied by " + str(balanced_values["balance_multiplier_2nd"]) + " to get its LCM form. (" + str(lcd) + ")"
				label_8.text = "We also change its numerator " + str(num2) + " by multiplying it by the same number you multiplied your denominator which is " + str(balanced_values["balance_multiplier_2nd"]) + "."
				label_9.text = "Then, simply add the changed numerators while the denominator should be the LCM. Finally, put the answers in these boxes."
			
			# Second fraction needs to be adjusted
			elif str(denum1) == str(lcd) and str(denum2) != str(lcd):
				label_5.text = "After, check the 1st fraction if it needs to change. In this example, denominator " + str(denum1) + " does not need to change since its already in its LCM form. (" + str(lcd) + ")"
				label_6.text = "So, we don't change its numerator " + str(num1) + " since its denominator is not changed."
				label_7.text = "Then, check the 2nd fraction if it needs to change. In this example, denominator " + str(denum2)+ " \nneeds to multiplied by " + str(balanced_values["balance_multiplier_2nd"]) + " to get its LCM form. (" + str(lcd) + ")"
				label_8.text = "We also change its numerator " + str(num2) + " by multiplying it by the same number you multiplied your denominator which is " + str(balanced_values["balance_multiplier_2nd"]) + "."
				label_9.text = "Then, simply add the changed numerator while the denominator should be the LCM. Finally, put the answers in these boxes."
			
			# First fraction needs to be adjusted
			else:
				label_5.text = "After, check the 1st fraction if it needs to change. In this example, denominator " + str(denum1)+ " \nneeds to multiplied by " + str(balanced_values["balance_multiplier_1st"]) + " to get its LCM form. (" + str(lcd) + ")"
				label_6.text = "We also change its numerator " + str(num1) + " by multiplying it by the same number you multiplied your denominator which is " + str(balanced_values["balance_multiplier_1st"]) + "."
				label_7.text = "Then, check the 2nd fraction if it needs to change. In this example, denominator " + str(denum2) + " does not need to change since its already in its LCM form. (" + str(lcd) + ")"
				label_8.text = "So, we don't change its numerator " + str(num2) + " since its denominator is not changed."
				label_9.text = "Then, simply add the changed numerator while the denominator should be the LCM. Finally, put the answers in these boxes."
