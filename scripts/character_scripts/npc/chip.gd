extends CharacterBody2D

func _ready():
	if DialogueState.current_quest == "chip_gameplay_done":
		$Actionable/CollisionShape2D.disabled = true
		$AutoActionable/CollisionShape2D.disabled = false
	elif DialogueState.current_quest == "after_wr_1" or DialogueState.current_quest == "starting":
		$Actionable/CollisionShape2D.disabled = false
		$AutoActionable/CollisionShape2D.disabled = true

func _process(delta: float) -> void:
	if DialogueState.current_quest == "after_chip":
		$Actionable/CollisionShape2D.disabled = false
		$AutoActionable/CollisionShape2D.disabled = true
