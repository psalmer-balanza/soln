# Or do you wanna try making dialogue autostart when you enter collision with the actionables, 
# instead of manually pressing space? 
# Or maybe try to implement dialogue -> gameplay scene 
# -> dialogue  cause all we have rn is dialogue -> gameplay scene -> floor 1

# BUG 1: Player stills walks since the PlayerDialogueState is not emitted (PARTIAL FIX)

extends Area2D

# Attach dialogue file
@export var dialogue_resource: DialogueResource
# Specify starting d
@export var dialogue_start: String = "start"
@onready var collision_encounter = $CollisionShape2D

# Deletes the collision shape after interaction
func delete_collision():
	collision_encounter.queue_free()

# Activated when main character walks into a autostart scene
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index) -> void:
	# To prevent spawning multiple dialogues
	if not PlayerState.player_in_dialogue:
		print("auto start encounter")
		PlayerState.player_in_dialogue = true
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		delete_collision()
