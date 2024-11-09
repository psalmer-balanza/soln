extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DialogueState.current_quest == "after_wr_3":
		$AutoActionable/CollisionShape2D.disabled = false
		$AnimationPlayer.play("disappear")
		$ExclamationMark.visible = false
	elif not DialogueState.current_quest == "after_wr_3":
		print("enabling auto in waterlogged 3")
		$AutoActionable/CollisionShape2D.disabled = false

func _process(delta):
	if DialogueState.disable_water_logged_3_quest:
		# After winning this gameplay, permanently make this scene invisible
		$".".visible = false
