extends CharacterBody2D

func _process(delta: float) -> void:
	if DialogueState.current_quest == "crab_boss" or DialogueState.current_quest == "crab_quiz_successful":
		$AutoActionable/CollisionShape2D.disabled = false
		$Actionable/CollisionShape2D.disabled = true
	elif DialogueState.current_quest == "after_wizard_training_room" or DialogueState.current_quest == "starting" or DialogueState.current_quest == "crab_quiz_after":
		$AutoActionable/CollisionShape2D.disabled = true
		$Actionable/CollisionShape2D.disabled = false
