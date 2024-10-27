# GdUnit generated TestSuite
class_name FractionProblemTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://scripts/gameplay_scripts/fraction_problem.gd'


func test__check_answer_is_zero() -> void:
	# remove this line and complete your test
	var test_script = auto_free(preload(__source).new())
	
	test_script.result_display = Label.new()
	add_child(test_script.result_display)
	
	var fraction: Array[int] = [5,0]
	var cor_ans: Array[int] = [5,2]
	test_script.user_answer = fraction
	test_script.correct_answer = cor_ans
	test_script._check_answer()
	
	assert_str(test_script.result_display.text)
	assert_signal(test_script).is_emitted("incorrect")

func test__check_answer_wrong_denom() -> void:
	# remove this line and complete your test
	var test_script = auto_free(preload(__source).new())
	
	test_script.result_display = Label.new()
	add_child(test_script.result_display)
	
	var fraction: Array[int] = [5,2]
	var cor_ans: Array[int] = [5,3]
	test_script.user_answer = fraction
	test_script.correct_answer = cor_ans
	test_script._check_answer()
	
	assert_str(test_script.result_display.text)
	assert_signal(test_script).is_emitted("incorrect")
	
func test__check_answer_wrong_nume() -> void:
	# remove this line and complete your test
	var test_script = auto_free(preload(__source).new())
	
	test_script.result_display = Label.new()
	add_child(test_script.result_display)
	
	var fraction: Array[int] = [4,3]
	var cor_ans: Array[int] = [5,3]
	test_script.user_answer = fraction
	test_script.correct_answer = cor_ans
	test_script._check_answer()
	
	assert_str(test_script.result_display.text)
	assert_signal(test_script).is_emitted("incorrect")

func test__check_answer_correct() -> void:
	# remove this line and complete your test
	var test_script = auto_free(preload(__source).new())
	
	test_script.result_display = Label.new()
	add_child(test_script.result_display)
	
	var fraction: Array[int] = [5,3]
	var cor_ans: Array[int] = [5,3]
	
	test_script.user_answer = fraction
	test_script.correct_answer = cor_ans
	
	test_script._check_answer()
	
	#assert_str(test_script.result_display.text)
	#assert_signal(test_script).is_emitted("correct")
	
func test_simplify_fraction() -> void:
	var test_script = auto_free(preload(__source).new())
	assert_array(test_script.simplify_fraction(5,10)).is_equal([1,2])
	

func test_simplify_fraction_inc() -> void:
	var test_script = auto_free(preload(__source).new())
	assert_array(test_script.simplify_fraction(1,2)).is_equal([1,2])
	
func test_is_simplified_not() -> void:
	var test_script = auto_free(preload(__source).new())
	var fraction: Array[int] = [5,10]
	test_script.user_answer = fraction
	assert_bool(test_script.is_simplified()).is_false()
	
func test_is_simplified() -> void:
	var test_script = auto_free(preload(__source).new())
	var fraction: Array[int] = [1,2]
	test_script.user_answer = fraction
	assert_bool(test_script.is_simplified()).is_true()
