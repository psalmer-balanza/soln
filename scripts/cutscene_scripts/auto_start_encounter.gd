extends Area2D

# Attach dialogue file
@export var dialogue_resource: DialogueResource
# Specify starting d
@export var dialogue_start: String = "start"
@onready var actionable_2 = $"."
@onready var collision_shape_2d = $CollisionShape2D

# Deletes the collision shape after interaction
func disable_auto_actionable():
	collision_shape_2d.disabled = true

# Activated when main character walks into a autostart scene
func _on_area_shape_entered():
	# To prevent spawning multiple dialogues
	if not PlayerState.player_in_dialogue:
		print("shape entered")
		DialogueState.in_dialogue = true
		PlayerState.player_in_dialogue = true
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		call_deferred("disable_auto_actionable")
