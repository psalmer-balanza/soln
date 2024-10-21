extends CharacterBody2D


func _process(_delta):
	if DialogueState.saisai_quest_progress == 0:
		$Actionable/CollisionShape2D.disabled = true
		$AnimatedSprite2D.visible = false
		$CollisionPolygon2D.disabled = true
		$AutoActionable/CollisionShape2D.disabled = true
	elif DialogueState.saisai_quest_progress == 1:
		$Actionable/CollisionShape2D.disabled = false
		$AnimatedSprite2D.visible = true
		$CollisionPolygon2D.disabled = false
		$AutoActionable/CollisionShape2D.disabled = true
	elif DialogueState.saisai_quest_progress == 2:
		$Actionable/CollisionShape2D.disabled = false
		$AnimatedSprite2D.visible = true
		$CollisionPolygon2D.disabled = false
		$AutoActionable/CollisionShape2D.disabled = false
	if DialogueState.saisai_quest_progress == 3:
		$AutoActionable/CollisionShape2D.disabled = true
		$RadialDialogueIndicator.visible = false
