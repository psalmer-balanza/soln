extends Control

@onready var numerator_input: LineEdit = $subtraction/VBoxContainer/HBoxContainer/answer_fraction/fraction/numerator/NumeratorAnswer
@onready var denominator_input: LineEdit = $subtraction/VBoxContainer/HBoxContainer/answer_fraction/fraction/denominator/DenominatorAnswer
@onready var first_num_label: Label = $subtraction/VBoxContainer/HBoxContainer/first_fraction/fraction/numerator
@onready var first_denum_label: Label = $subtraction/VBoxContainer/HBoxContainer/first_fraction/fraction/denominator
@onready var second_num_label: Label = $subtraction/VBoxContainer/HBoxContainer/second_fraction/fraction/numerator
@onready var second_denum_label: Label = $subtraction/VBoxContainer/HBoxContainer/second_fraction/fraction/denominator
@onready var display_answer: Label = $subtraction/VBoxContainer/result

var first_num: int
var first_denum: int
var second_num: int
var second_denum: int
var is_simplified = false

func _subtraction_checker():
	pass


func _on_submit_answer_pressed() -> void:
	first_num = 
	first_denum = first_denum_label
	second_num
	second_denum
	
	
