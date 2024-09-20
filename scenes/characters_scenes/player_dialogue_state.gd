extends State
class_name PlayerDialogueState
@export var player: CharacterBody2D
@onready var actionable_finder: Area2D = $"../../ActionableFinder"

func Enter():
	print("Now in dialogue state")

	var sprite = player.get_node("AnimatedSprite2D")  # Correctly access the child node
	sprite.play("idle")
	player.velocity = Vector2.ZERO
	# Trigger dialogue once
	var actionables = actionable_finder.get_overlapping_areas()
	if actionables.size() > 0:
		print("Dialogue found")
		actionables[0].action()  # Trigger the dialogue interaction
		Transitioned.emit(self, "IdleState")
	else:
		print("No dialogue found")


func Update(delta: float):
	if DialogueState.in_dialogue == false:
		Transitioned.emit(self, "IdleState")

# Player must not move during dialogue so do NOTHING HERE
func Physics_Update(delta: float):
	pass
	
func Exit():
	pass
