extends Control

@onready var objective = $"../ObjectiveOverlay"
@onready var badges = $"../OnscreenBadges"
@onready var character = $"../.."

func _process(delta: float) -> void:
	if Input.is_action_just_released("pause"):
		_pause()

func _pause():
	character.get_tree().paused = true
	self.visible = true
	objective.visible = false
	badges.visible = false

func _on_back_pressed() -> void:
	character.get_tree().paused = false
	self.visible = false
	objective.visible = true
	badges.visible = true

func _on_main_menu_pressed() -> void:
	#add game save here
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
