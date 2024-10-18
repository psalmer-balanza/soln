extends Control

@onready var same_denominator_tutorial_1 = $SameDenominatorTutorial1

func _on_quick_tutorial_change() -> void:
	same_denominator_tutorial_1.visible = true
