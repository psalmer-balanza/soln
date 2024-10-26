# GdUnit generated TestSuite
class_name FractionProblemTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scripts/gameplay_scripts/fraction_problem.gd'


func test__addition() -> void:
	# remove this line and complete your test
	var test_script = auto_free(preload(__source).new())
	var num1 = "5"
	var num2 = "5"
	var deno1 = "5"
	var deno2 = "5"
	
	var nume1 = int(num1.text)
	var nume2 = int(num2.text)
	var denom1 = int(deno1.text)
	var denom2 = int(deno2.text)
	
	assert_int(test_script._addition())

	
	
