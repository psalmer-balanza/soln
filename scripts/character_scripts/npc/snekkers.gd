extends CharacterBody2D


@onready var snekkers_healed = $SnekkersHealed
@onready var snekkers_mushroomed = $SnekkersMushroomed

func _ready():
	if DialogueState.current_quest == "you_may_leave_floor_1":
		snekkers_mushroomed.visible = false
		snekkers_healed.visible = true
	
	if DialogueState.current_quest == "snake_quiz_complete":
		snekkers_mushroomed.visible = false
		snekkers_healed.visible = true

func _process(delta: float):
	if DialogueState.current_quest == "you_may_leave_floor_1":
		snekkers_mushroomed.visible = false
		snekkers_healed.visible = true

	
	if DialogueState.current_quest == "snake_quiz_complete":
		snekkers_mushroomed.visible = false
		snekkers_healed.visible = true
