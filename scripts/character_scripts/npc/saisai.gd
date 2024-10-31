extends CharacterBody2D
@onready var radial_dialogue_indicator: Node2D = $RadialDialogueIndicator
@onready var actionable_collision: CollisionShape2D = $Actionable/CollisionShape2D
@onready var saisai_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var auto_actionable_collision: CollisionShape2D = $AutoActionable/CollisionShape2D
@onready var sai_collision: CollisionPolygon2D = $CollisionPolygon2D
@onready var saisai: CharacterBody2D = $"."
@onready var disable_saisai_quest = false

func _process(_delta):
	# ARRIVE AT SAISAI'S PLACE
	if DialogueState.current_quest == "saisai_house_invite":
		actionable_collision.disabled = false
		saisai_sprite.visible = true
		sai_collision.disabled = false
		auto_actionable_collision.disabled = true
	# FINISH COOKING GAME
	elif DialogueState.current_quest == "saisai_pie_making":
		actionable_collision.disabled = true
		saisai_sprite.visible = true
		sai_collision.disabled = false
		auto_actionable_collision.disabled = false
	# YOU ARE SENT OFF TO FIND RAKET HOUSE
	elif DialogueState.current_quest == "find_raket_house":
		auto_actionable_collision.disabled = true
		radial_dialogue_indicator.visible = false
		disable_saisai_quest = true

func _ready():
	if disable_saisai_quest:
		saisai.queue_free()
