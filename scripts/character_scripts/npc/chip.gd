extends CharacterBody2D

func _process(_delta):
	if DialogueState.current_quest == "meeting_chip" or DialogueState.current_quest == "chip_gameplay_done":
		$Actionable/CollisionShape2D.disabled = true
		$AutoActionable/CollisionShape2D.disabled = false
	elif DialogueState.current_quest == "chip_gameplay_done":
		$Actionable/CollisionShape2D.disabled = true
		$AutoActionable/CollisionShape2D.disabled = false
	else:
		$Actionable/CollisionShape2D.disabled = false
