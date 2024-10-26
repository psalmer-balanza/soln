# GdUnit generated TestSuite
class_name GlobalFractionFunctionsTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scripts/global_scripts/global_fraction_functions.gd'

func test_gcd() -> void:
	var test_script = auto_free(preload(__source).new())
	assert_int(test_script.gcd(5,10)).is_equal(5)
	
func test_gcd_inc() -> void:
	var test_script = auto_free(preload(__source).new())
	assert_int(test_script.gcd(5,10)).is_not_equal(10)
	
func test_get_lcd() -> void:
	# remove this line and complete your test
	var test_script = auto_free(preload(__source).new())
	assert_int(test_script.get_lcd(5,10)).is_equal(10)

func test_lcd_inc() -> void:
	var test_script = auto_free(preload(__source).new())
	assert_int(test_script.gcd(5,10)).is_not_equal(10)
	
func test_check_lowest_form_false() -> void:
	var test_script = auto_free(preload(__source).new())
	assert_bool(test_script.check_lowest_form(1,2)).is_false()
	
func test_check_lowest_form_true() -> void:
	var test_script = auto_free(preload(__source).new())
	assert_bool(test_script.check_lowest_form(5,10)).is_true()
