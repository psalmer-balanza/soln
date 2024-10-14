extends State
class_name PlayerDialogueState
@export var player: CharacterBody2D
@onready var actionable_finder: Area2D = $"../../ActionableFinder"
@onready var walking_sfx: AudioStreamPlayer = $"../../WalkingSFX"


func Enter():
	walking_sfx.stop()
	var sprite = player.get_node("AnimatedSprite2D")  # Correctly access the child node
	sprite.play("idle")
	player.velocity = Vector2.ZERO
	# Trigger dialogue once
	var actionables = actionable_finder.get_overlapping_areas()
	if actionables.size() > 0:
		actionables[0].action()  # Trigger the dialogue interactiondddddddd
	
	start_dialogue_wait()

# Asynchronously wait for the dialogue to end
func start_dialogue_wait() -> void:
	await DialogueManager.dialogue_ended  # Wait for the dialogue to end
	Transitioned.emit(self, "IdleState")  # Transition back to IdleState when dialogue ends

func Update(delta: float):
	print("dialogue")
	pass

# Player must not move during dialogue so do NOTHING HERE
func Physics_Update(delta: float):
	player.velocity = Vector2.ZERO  # Reinforce that the player cannot move
	
func Exit():
	pass
