# Or do you wanna try making dialogue autostart when you enter collision with the actionables, 
# instead of manually pressing space? 
# Or maybe try to implement dialogue -> gameplay scene 
# -> dialogue  cause all we have rn is dialogue -> gameplay scene -> floor 1
extends Area2D

# Attach dialogue file
@export var dialogue_resource: DialogueResource
# Specify starting d
@export var dialogue_start: String = "start"

# Show balloon when actionable is activated
func action() -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)

# Activated when main character walks into a autostart scene
func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	action()
