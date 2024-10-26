extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var actionable_collision: CollisionShape2D = $AutoActionable/CollisionShape2D
@onready var raket_sprite: AnimatedSprite2D = $AnimatedSprite2D
var raket_steal = false
var raket_steal_quest = false

func _process(_delta):
	if DialogueState.raket_sneaking and not raket_steal:
		raket_stealing()
		raket_steal = true
	if DialogueState.raket_sneaking_quest_complete and not raket_steal_quest:
		raket_delete_node()
		raket_steal_quest = true

func raket_stealing() -> void:
	print("raket is here")
	animation_player.play("raket_stealing")
	await animation_player.animation_finished
	raket_steal = true
	
func raket_delete_node() -> void:
	raket_sprite.visible = false
	
