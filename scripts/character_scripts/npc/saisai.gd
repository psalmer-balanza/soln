extends CharacterBody2D
@onready var radial_dialogue_indicator: Node2D = $RadialDialogueIndicator
@onready var actionable_collision: CollisionShape2D = $Actionable/CollisionShape2D
@onready var saisai_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var auto_actionable_collision: CollisionShape2D = $AutoActionable/CollisionShape2D
@onready var sai_collision: CollisionPolygon2D = $CollisionPolygon2D

func _process(_delta):
	# BEFORE ARRIVAL/ YOU ARE AT THE WHEELBARROW QUEST
	if DialogueState.saisai_quest_progress == 0:
		actionable_collision.disabled = true
		saisai_sprite.visible = false
		sai_collision.disabled = true
		auto_actionable_collision.disabled = true
	# ARRIVE AT SAISAI'S PLACE
	elif DialogueState.saisai_quest_progress == 1:
		actionable_collision.disabled = false
		saisai_sprite.visible = true
		sai_collision.disabled = false
		auto_actionable_collision.disabled = true
	# FINISH COOKING GAME
	elif DialogueState.saisai_quest_progress == 2:
		actionable_collision.disabled = true
		saisai_sprite.visible = true
		sai_collision.disabled = false
		auto_actionable_collision.disabled = false
	# YOU ARE SENT OFF TO FIND RAKET HOUSE
	if DialogueState.saisai_quest_progress == 3:
		auto_actionable_collision.disabled = true
		radial_dialogue_indicator.visible = false
