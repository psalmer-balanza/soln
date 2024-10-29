extends CharacterBody2D


func _process(_delta):
	if DialogueState.current_quest == "share_pie_with_raket" or DialogueState.current_quest == "starting":
		manual_actionable(true)
	if DialogueState.current_quest == "raket_house" or DialogueState.current_quest == "raket_house_worded_complete":
		manual_actionable(false)
	if DialogueState.current_quest == "raket_sword_quest":
		manual_actionable(true)
	if DialogueState.current_quest == "face_the_snake":
		$RadialDialogueIndicator.visible = false

func manual_actionable(is_enabled: bool):
	print(is_enabled)
	$Actionable/CollisionShape2D.disabled = !is_enabled
	$AutoActionable/CollisionShape2D.disabled = is_enabled
