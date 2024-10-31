extends CharacterBody2D

@onready var manual_actionable = $Actionable/CollisionShape2D
@onready var auto_actionable = $AutoActionable2/CollisionShape2D

func _process(_delta):
	if DialogueState.current_quest == "share_pie_with_raket" or DialogueState.current_quest == "starting":
		enable_auto_dialogue(false)
		$RadialDialogueIndicator.visible = true
	elif DialogueState.current_quest == "raket_house_worded_complete":
		enable_auto_dialogue(true)
		$RadialDialogueIndicator.visible = false
	elif DialogueState.current_quest == "raket_sword_quest":
		enable_auto_dialogue(false)
		$RadialDialogueIndicator.visible = true
	elif DialogueState.current_quest == "face_the_snake":
		enable_auto_dialogue(false)
		$RadialDialogueIndicator.visible = false
	elif DialogueState.current_quest == "raket_sword_pieces_complete":
		$RadialDialogueIndicator.visible = true
	elif DialogueState.current_quest == "sword_finished":
		enable_auto_dialogue(true)
	elif DialogueState.current_quest == "raket_house":
		enable_auto_dialogue(true)
func enable_auto_dialogue(is_enabled: bool):
	manual_actionable.disabled = is_enabled
	auto_actionable.disabled = !is_enabled
