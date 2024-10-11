extends CharacterBody2D


func _process(_delta):
	if DialogueState.raket_quest_progress == 3:
		$SpeechBalloon.visible = false
	if DialogueState.raket_quest_progress == 2:
		$SpeechBalloon.visible = false
	if DialogueState.sword_bottom and DialogueState.sword_guard and DialogueState.sword_lower_blade and DialogueState.sword_middle_blade and DialogueState.sword_top_blade:
		$SpeechBalloon.visible = true
	if DialogueState.raket_sword_complete:
		$SpeechBalloon.visible = false
