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
func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	# To prevent spawning multiple dialogues
	if not PlayerState.player_in_dialogue:
		PlayerState.player_in_dialogue = true
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		delete_collision()
