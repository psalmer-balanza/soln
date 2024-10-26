# GdUnit generated TestSuite
class_name Area2dTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scenes/gameplay_scenes/cooking_mini_game/area_2d.gd'

#test if fraction is correct 
func test__add_fractions() -> void:
	# remove this line and complete your test
	
	var test_script = auto_free(preload(__source).new())
	var fraction:Array[int] = [15,5]
	assert_array(test_script._add_fractions(5,5,5,5,5,5)).is_equal(fraction)
	
func test__add_fraction_inc() -> void:
	var test_script = auto_free(preload(__source).new())
	var fraction:Array[int] = [20,5]
	assert_array(test_script._add_fractions(5,5,5,5,5,5)).is_not_equal(fraction)
	
func test_fraction_add() -> void:
	
	var test_script = auto_free(preload(__source).new())
	var fraction:Array[int] = [10,5]
	assert_array(test_script.fraction_addition(5,5,5,5)).is_equal(fraction)
