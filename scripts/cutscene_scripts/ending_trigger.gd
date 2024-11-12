extends Area2D


# Attach dialogue file
@export var dialogue_resource: DialogueResource
# Specify starting d
@export var dialogue_start: String = "start"
# To know the current quest
@export var quest_name: String

@onready var collision_shape_2d = $CollisionShape2D

# To disable the auto actionable after a gameplay
var is_quest_complete: bool

@onready var camera = $"../../Camera2D"
@onready var timer = $"../../Timer"
@onready var animation = $"../../AnimationPlayer"

@onready var character = $"../../../MainCharacter"

var ending_done = true

func _ready():
	is_quest_complete = DialogueState.get_quest_status(quest_name)
	if is_quest_complete:
		call_deferred("disable_auto_actionable")

func _process(delta):
	is_quest_complete = DialogueState.get_quest_status(quest_name)
	if is_quest_complete:
		call_deferred("disable_auto_actionable")
	if DialogueState.current_quest == "ending":
		if ending_done:
			play_ending()
			ending_done = false

# Disables the collision shape after interaction
func disable_auto_actionable():
	collision_shape_2d.disabled = true

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if not PlayerState.player_in_dialogue:
		DialogueState.in_dialogue = true
		PlayerState.player_in_dialogue = true
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		call_deferred("disable_auto_actionable")

func play_ending():
	camera.make_current()
	animation.play("float_up")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("animation done")
	if anim_name == "float_up":
		character.explode()
		timer.start()
		animation.play("float")
	if anim_name == "float_down":
		get_tree().change_scene_to_file("res://scenes/ui/credits.tscn")

func _on_timer_timeout() -> void:
	animation.play("float_down")
