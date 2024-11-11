extends CharacterBody2D
var first_meet_disappear_animation_done = false

func _process(delta: float) -> void:
	if DialogueState.current_quest == "after_meeting_wizard_rat" and first_meet_disappear_animation_done == false:
		first_meet_disappear_animation_done = true
		$AnimationPlayer.play("zoom")
		print("hello")
		
	if DialogueState.current_quest == "wizard_training_room" or DialogueState.current_quest == "wizard_training_room_worded_complete":
		$"../RatTrainingArea/Actionable/CollisionShape2D".disabled = true
		$"../RatTrainingArea/AutoActionable/CollisionShape2D".disabled = false
		
	elif DialogueState.current_quest == "after_wizard_training_room" or DialogueState.current_quest == "after_wr_3" or DialogueState.current_quest == "starting":
		$"../RatTrainingArea/Actionable/CollisionShape2D".disabled = false
		$"../RatTrainingArea/AutoActionable/CollisionShape2D".disabled = true
	if DialogueState.current_quest == "after_wizard_training_room":
		$SpeechBalloon.visible = false
