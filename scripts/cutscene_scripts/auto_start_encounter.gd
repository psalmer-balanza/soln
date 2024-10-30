extends Area2D

# Attach dialogue file
@export var dialogue_resource: DialogueResource
# Specify starting d
@export var dialogue_start: String = "start"
# To know the current quest
@export var quest_name: String

@onready var collision_shape_2d = $CollisionShape2D

# Disable the auto actionable after a gameplay
var is_quest_complete: bool

func _ready():
	is_quest_complete = DialogueState.get_quest_status(quest_name)
	if is_quest_complete:
		call_deferred("disable_auto_actionable")
	

func _process(delta):
	is_quest_complete = DialogueState.get_quest_status(quest_name)
	if is_quest_complete:
		call_deferred("disable_auto_actionable")


# Disables the collision shape after interaction
func disable_auto_actionable():
	collision_shape_2d.disabled = true


# Activated when main character walks into a auto actionable scene
func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	# To prevent spawning multiple dialogues
	if not PlayerState.player_in_dialogue:
		DialogueState.in_dialogue = true
		PlayerState.player_in_dialogue = true
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		call_deferred("disable_auto_actionable")
