# GdUnit generated TestSuite
class_name TestScriptTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scripts/gameplay_scripts/test_script.gd'


func test_return_5() -> void:
	var test_script = preload(__source).new()
	print(test_script.return_5())
	assert_int(test_script.return_5()).is_equal(5)
