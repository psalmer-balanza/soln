extends CharacterBody2D


func _process(_delta):
	if PlayerState.saisai_quest_progress == 0:
		$AnimatedSprite2D.visible = false
		$CollisionPolygon2D.disabled = true
	elif PlayerState.saisai_quest_progress == 1:
		$AnimatedSprite2D.visible = true
		$CollisionPolygon2D.disabled = false
