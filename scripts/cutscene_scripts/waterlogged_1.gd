extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DialogueState.current_quest == "after_wr_1":
		$AutoActionable/CollisionShape2D.disabled = true
		$AnimationPlayer.play("disappear")
		$ExclamationMark.visible = false
	elif not DialogueState.current_quest == "after_wr_1":
		print("enabling auto in waterlogged 1")
		$AutoActionable/CollisionShape2D.disabled = false
