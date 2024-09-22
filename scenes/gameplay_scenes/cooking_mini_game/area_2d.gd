extends Area2D

@onready var item_container = $"../ItemContainer"
@onready var label = $"../Label"
@onready var butter_label = $"../UI/recipe/MarginContainer/VBoxContainer/butter"
@onready var mushroom_label = $"../UI/recipe/MarginContainer/VBoxContainer/mushroom"
@onready var garic_label = $"../UI/recipe/MarginContainer/VBoxContainer/garlic"

var pass_color:Color = Color('#508d76')
var def_color:Color = Color('#352b40')
var wrong_color: Color = Color('#933f45')

var needed_butter:int = 1
var butter_container:Array[String] = []

var needed_mushroom:int = 1
var mushroom_container:Array[String] = []

var needed_garlic:int = 1
var garlic_container:Array[String] = []

var container:Array[String] = []

var conditions_met:bool = false

func _process(delta: float) -> void:
	label.text = "Items: " + str(butter_container.size() + mushroom_container.size() + garlic_container.size())
	_check_conditions()

func _check_conditions():
	if needed_butter == butter_container.size():
		butter_label.set("theme_override_colors/font_color", pass_color)
	else:
		butter_label.set("theme_override_colors/font_color", wrong_color)
	if needed_mushroom == mushroom_container.size():
		mushroom_label.set("theme_override_colors/font_color", pass_color)
	else:
		mushroom_label.set("theme_override_colors/font_color", wrong_color)
	if needed_garlic == garlic_container.size():
		garic_label.set("theme_override_colors/font_color", pass_color)
	else:
		garic_label.set("theme_override_colors/font_color", wrong_color)

func _string_checker(name:String, item:CharacterBody2D) -> bool:
	if item.name.contains(name):
		return true
	return false

func _on_body_entered(body: Node2D) -> void:
	if _string_checker("butter", body):
		butter_container.append(body.name)
	elif _string_checker("mushroom", body):
		mushroom_container.append(body.name)
	elif _string_checker("garlic", body):
		garlic_container.append(body.name)

func _on_body_exited(body: Node2D) -> void:
	if _string_checker("butter", body):
		butter_container.erase(body.name)
	elif _string_checker("mushroom", body):
		mushroom_container.erase(body.name)
	elif _string_checker("garlic", body):
		garlic_container.erase(body.name)
