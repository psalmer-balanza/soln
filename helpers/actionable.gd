extends Area2D

# Attach dialogue file
@export var dialogue_resource: DialogueResource
# Specify starting d
@export var dialogue_start: String = "start"

# Show balloon when actionable is activated
func action() -> void:
	DialogueState.in_dialogue = true
	DialogueState.current_quest = "floor_3"
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
