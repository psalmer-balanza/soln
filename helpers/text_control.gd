extends Control

@onready var numerator = $"../Numerator/NumeratorAnswer"
@onready var denominator = $"../Denominator/DenominatorAnswer"

func _control_text(new_text:String, field:LineEdit):
	var old_caret_position:int = field.caret_column
	var input: String = ""
	var regex: RegEx = RegEx.new()
	regex.compile("[0-9]")
	var diff:int = regex.search_all(new_text).size() - new_text.length()
	for valid_character in regex.search_all(new_text):
		input += valid_character.get_string()
	field.set_text(input)
	field.caret_column = old_caret_position + diff

func _on_numerator_answer_text_changed(new_text: String) -> void:
	_control_text(new_text, numerator)

func _on_denominator_answer_text_changed(new_text: String) -> void:
	_control_text(new_text, denominator)
