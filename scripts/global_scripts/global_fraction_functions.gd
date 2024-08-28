extends Node

# Function to get the least common denominator (LCD)/ least common multiple (LCM)
func get_lcd(first_denominator, second_denominator):
	return abs(first_denominator * second_denominator) / gcd(first_denominator, second_denominator)

# Function to get the greatest common divisor (GCD)
func gcd(first_denominator, second_denominator):
	while second_denominator != 0:
		var temp = second_denominator
		second_denominator = first_denominator % second_denominator
		first_denominator = temp
	return first_denominator
