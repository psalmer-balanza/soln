extends Area2D

@onready var item_container = $"../ItemContainer"
@onready var label = $"../Label"
@onready var butter_label:Label = $"../Counter/recipe/MarginContainer/VBoxContainer/butter"
@onready var mushroom_label:Label = $"../Counter/recipe/MarginContainer/VBoxContainer/mushroom"
@onready var garic_label:Label = $"../Counter/recipe/MarginContainer/VBoxContainer/garlic"
@onready var correct_screen = $"../UI/Control/Congrats"
@onready var incorrect_screen = $"../UI/Control/Oh no"
@onready var color_rect = $"../UI/Control/ColorRect"
@onready var particle = $"../Counter/particle"

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
	var fraction = _add_fractions(2, 3, 6, butter_container.size(), mushroom_container.size(), garlic_container.size())
	label.text = "INGREDIENTS: " + (
		str(butter_container.size())+ "/2 + " + str(mushroom_container.size())+ "/3 + " + str(garlic_container.size())+ "/6 "
		) + "\n" + "= " + str(fraction[0]) + "/" + str(fraction[1])

func _check_conditions():
	if needed_butter == butter_container.size():
		butter_label.set("theme_override_colors/font_color", pass_color)
		particle.emitting = true
	else:
		butter_label.set("theme_override_colors/font_color", wrong_color)
	if needed_mushroom == mushroom_container.size():
		mushroom_label.set("theme_override_colors/font_color", pass_color)
		particle.emitting = true
	else:
		mushroom_label.set("theme_override_colors/font_color", wrong_color)
	if needed_garlic == garlic_container.size():
		garic_label.set("theme_override_colors/font_color", pass_color)
		particle.emitting = true
	else:
		garic_label.set("theme_override_colors/font_color", wrong_color)
	
	if needed_butter == butter_container.size() && needed_mushroom == mushroom_container.size() && needed_garlic == garlic_container.size():
		conditions_met = true
	else:
		conditions_met = false

func _correct_condition(label:Label):
	label.set("theme_override_colors/font_color", pass_color)
	particle.emitting = true

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
	_check_conditions()

func _on_body_exited(body: Node2D) -> void:
	if _string_checker("butter", body):
		butter_container.erase(body.name)
	elif _string_checker("mushroom", body):
		mushroom_container.erase(body.name)
	elif _string_checker("garlic", body):
		garlic_container.erase(body.name)
	_check_conditions()

func _on_cook_button_pressed() -> void:
	color_rect.visible = true
	if conditions_met:
		correct_screen.visible = true
	else:
		incorrect_screen.visible = true

func _on_correct_pressed() -> void:
	print("Returning")
	get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
	pass # Connect with main scene

func _on_incorrect_pressed() -> void:
	incorrect_screen.visible = false
	color_rect.visible =  false

func _add_fractions(denom1:int, denom2:int, denom3:int, nume1:int, nume2:int, nume3:int):
	var numerator:int
	var denominator:int
	var fraction:Array [int] = [0,0]
	
	# first and second number
	fraction = fraction_addition(nume1, denom1, nume2, denom2)
	
	# second and third number
	fraction = fraction_addition(fraction[0], fraction[1], nume3, denom3)
	
	return fraction

func fraction_addition(
	first_numerator: int, first_denominator: int, second_numerator: int, second_denominator: int
	):
	var numerator:int = 0
	var denominator:int = 0
	var fraction:Array[int] = [0,0]
	
	if first_denominator == second_denominator:
		numerator = first_numerator + second_numerator
		denominator = first_denominator
	
	else: # DIFFERENT DANAMANATORS
		var lcd = GlobalFractionFunctions.get_lcd(first_denominator, second_denominator)
		var adjusted_first_numerator = first_numerator * (lcd / first_denominator)
		var adjusted_second_numerator = second_numerator * (lcd / second_denominator)
		numerator = adjusted_first_numerator + adjusted_second_numerator
		denominator = lcd
	
	fraction[0] = numerator
	fraction[1] = denominator
	
	return fraction
