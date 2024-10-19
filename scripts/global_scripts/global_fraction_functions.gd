extends Node

# Function to get the least common denominator (LCD)/ least common multiple (LCM)
func get_lcd(first_denominator: int, second_denominator: int):
	return abs(first_denominator * second_denominator) / gcd(first_denominator, second_denominator)

# Function to get the greatest common divisor (GCD)
func gcd(first_denominator: int, second_denominator: int) -> int:
	while second_denominator != 0:
		var temp = second_denominator
		second_denominator = first_denominator % second_denominator
		first_denominator = temp
	return first_denominator

# Function to determine if the answer can be simplified
func check_lowest_form(numerator_answer: int, denominator_answer: int) -> bool:
	var gcd_value = gcd(numerator_answer, denominator_answer)
	
	 # If the GCD is 1, the fraction is already in its lowest form
	return gcd_value != 1

# Function to get the number to be multiplied with a num and denum to balance it out
func balance_num_and_denum(num_1st: int, denum_1st: int, num_2nd:int, denum_2nd:int, lcd: int):
	var balance_multiplier_1st = lcd / denum_1st
	var balance_multiplier_2nd = lcd / denum_2nd
	
	var balanced_1st_num = balance_multiplier_1st * num_1st
	var balanced_1st_denum = balance_multiplier_1st * denum_1st
	var balanced_2nd_num = balance_multiplier_2nd * num_2nd
	var balanced_2nd_denum = balance_multiplier_2nd * denum_2nd
	
	return {
		"balance_multiplier_1st": balance_multiplier_1st,
		"balance_multiplier_2nd": balance_multiplier_2nd,
		"balanced_1st_num": balanced_1st_num,
		"balanced_1st_denum": balanced_1st_denum,
		"balanced_2nd_num": balanced_2nd_num,
		"balanced_2nd_denum": balanced_2nd_denum
	}
