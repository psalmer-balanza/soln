extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta):
	# Collecting sword pieces or leaving floor 1
	if DialogueState.current_quest == "raket_sword_quest":
		manual_actionable(true)
	
	if DialogueState.current_quest == "face_the_snake":
		manual_actionable(true)

	if DialogueState.current_quest == "you_may_leave_floor_1":
		manual_actionable(true)

func manual_actionable(is_enabled: bool):
	$Actionable/CollisionShape2D.disabled = !is_enabled
	$AutoActionable/CollisionShape2D.disabled = is_enabled
