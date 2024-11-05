extends Control

@onready var objective = $"../ObjectiveOverlay"
@onready var badges = $"../OnscreenBadges"

func _process(delta: float) -> void:
	if Input.is_action_just_released("pause"):
		get_tree().paused = true
		_pause()

func _pause():
	show()
	objective.visible = false
	badges.visible = false

func _on_back_pressed() -> void:
	print("unpaused")
	get_tree().paused = false
	hide()
	objective.visible = true
	badges.visible = true

func _on_main_menu_pressed() -> void:
	print("main menu")
	#add game save here
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
