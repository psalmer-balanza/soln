extends Node

# Function to get the least common denominator (LCD)/ least common multiple (LCM)
func get_lcd(first_denominator: int, second_denominator: int):
	return abs(first_denominator * second_denominator) / gcd(first_denominator, second_denominator)

# Function to get the greatest common divisor (GCD)
func gcd(first_denominator: int, second_denominator: int):
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
	
