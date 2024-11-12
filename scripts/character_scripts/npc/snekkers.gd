extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var snekkers_healed = $SnekkersHealed
@onready var snekkers_mushroomed = $SnekkersMushroomed


func _process(delta):
	# Collecting sword pieces or leaving floor 1
	if DialogueState.current_quest == "raket_sword_quest":
		manual_actionable(true)
	
	if DialogueState.current_quest == "face_the_snake":
		manual_actionable(true)

	if DialogueState.current_quest == "you_may_leave_floor_1":
		print("from snekkers, current quest ", DialogueState.current_quest)
		snekkers_mushroomed.visible = false
		snekkers_healed.visible = true
		manual_actionable(true)
	
	if DialogueState.current_quest == "snake_quiz_complete":
		print("from snekkers, current quest ", DialogueState.current_quest)
		snekkers_mushroomed.visible = false
		snekkers_healed.visible = true

func manual_actionable(is_enabled: bool):
	$Actionable/CollisionShape2D.disabled = !is_enabled
	$AutoActionable/CollisionShape2D.disabled = is_enabled
