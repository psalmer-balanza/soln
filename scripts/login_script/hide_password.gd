extends CheckButton

@onready var password_line_edit: LineEdit = $".."
var is_hidden: bool = false

func _on_button_down():
	if !is_hidden:
		self_modulate = Color.INDIAN_RED
		password_line_edit.secret = false
		is_hidden = true
		
	else:
		self_modulate = Color.LIME_GREEN
		password_line_edit.secret = true
		is_hidden = false
