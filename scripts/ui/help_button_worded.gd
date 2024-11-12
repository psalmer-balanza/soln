extends Button

# Tutorials scenes
@onready var quick_tutorial_worded = $"../QuickTutorial"

# Tutorial for worded fraction gameplay
func _on_button_down():
	quick_tutorial_worded.visible = true
