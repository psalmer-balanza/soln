extends Node2D
@onready var label: Label = $Label
var quest_status := {}
@onready var typing_sfx: AudioStreamPlayer = $TypingSFX
# Typewriter effect variables
@export var typing_speed := 0.069  # Speed of the typewriter effect
var typewriter_timer := 0.0
var current_characters := 0  # Tracks visible characters for the typewriter effect

func _ready() -> void:
	#LOCAL VAERIABLE SO THAT IT DOESNT DO ANIMATIONS IN PROCES DELTA MULTIPLE TIMES
	quest_status = {
		"movable_rock": false,
		"movable_rock_done": false,
		"saisai_wheelbarrow": false,
		"saisai_house_invite": false,
		"saisai_pie_making": false,
		"find_raket_house": false,
		"share_pie_with_raket": false,
		"raket_house": false,
		"raket_house_worded_complete": false,
		"raket_sword_quest": false,
		"raket_sword_pieces_complete": false,
		"sword_finished": false,
		"face_the_snake": false,
		"snake_quiz_complete": false,
		"you_may_leave_floor_1": false,

		#FLOOR 2 QUESTS
		"entered_floor_2": false,
		"robob_first_meet": false,
		"after_robob": false,
		"water_room_1": false,
		"after_wr_1": false,
		"meeting_chip": false,
		"after_chip": false,
		"water_room_2": false,
		"after_wr_2": false,
		"meeting_wizard_rat": false,
		"after_meeting_wizard_rat": false,
		"water_room_3": false,
		"after_wr_3": false,
		"wizard_training_room": false,
		"after_wizard_training_room": false,
		"robob_21f31irst_meet": false,
		"robob_3first_meet": false,
		"robob_3first13_meet": false
	}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cq = DialogueState.current_quest
	match cq:
		"movable_rock":
			handle_quest_label(cq, "Remove the rock in your path.")
		"movable_rock_done":
			handle_quest_label(cq, "Cross the bridge.")
		"saisai_wheelbarrow":
			handle_quest_label(cq, "Assist the rabbit creature.")
		"saisai_house_invite":
			handle_quest_label(cq, "Visit Saisai's house.")
		"saisai_pie_making":
			handle_quest_label(cq, "Assist in the baking.")
		"find_raket_house":
			handle_quest_label(cq, "Find Raket the Raccoon's house.")
		"share_pie_with_raket":
			handle_quest_label(cq, "Find Raket the Blacksmith's house\n and share a pie with him.")
		"raket_house":
			handle_quest_label(cq, "Share a pie with Raket.")
		"raket_house_worded_complete":
			handle_quest_label(cq, "Talk to Raket.")
		"raket_sword_quest":
			handle_quest_label(cq, "Find the sword materials in the cave.")
		"raket_sword_pieces_complete":
			handle_quest_label(cq, "Return to Raket with the sword materials.")
		"sword_finished":
			handle_quest_label(cq, "Talk to Raket and see the result of the smithing.")
		"face_the_snake":
			handle_quest_label(cq, "Face Snekkers the Snake in the cave.")
		"snake_quiz_complete":
			handle_quest_label(cq, "Learn about the chosen one.")
		"you_may_leave_floor_1":
			handle_quest_label(cq, "Go to the sewer pipe.")
		#FLOOR 2 
		"entered_floor_2":
			handle_quest_label(cq, "Explore this new area.")
		"robob_first_meet":
			handle_quest_label(cq, "Learn more about the floor from Robob.")
		"after_robob":
			handle_quest_label(cq, "Find the waterlogged room.")
		"water_room_1":
			handle_quest_label(cq, "Clear the water from the room.")
		"after_wr_1":
			handle_quest_label(cq, "Cross the room.")
		"after_chip":
			handle_quest_label(cq, "Find the wizard rat.")
		"water_room_2":
			handle_quest_label(cq, "Clear the water from the room.")
		"after_wr_2":
			handle_quest_label(cq, "Cross the room and find the wizard rat.")
		"meeting_wizard_rat":
			handle_quest_label(cq, "Learn more from the wizard rat.")
		"after_meeting_wizard_rat":
			handle_quest_label(cq, "Find the wizard rat's training area.")
		"wizard_training_room":
			handle_quest_label(cq, "Pass the wizard rat's trials.")
		"after_wizard_training_room":
			handle_quest_label(cq, "Face the Giant Enemy Crab.")
			
	# Typewriter effect update
	if current_characters < label.text.length():
		typewriter_timer -= delta
		if typewriter_timer <= 0:
			typewriter_timer = typing_speed
			current_characters += 1
			label.visible_characters = current_characters
			if typing_sfx.playing == false:  # Avoid overlapping sounds
				typing_sfx.pitch_scale = randf_range(0.53, 0.73)
				typing_sfx.play()

func handle_quest_label(quest_name: String, objective_text: String) -> void:
	if not quest_status[quest_name]:
		quest_status[quest_name] = true
		#Put in new text
		label.text = "Current Objective: " + objective_text
		label.visible_characters = 0
		current_characters = 0
		typewriter_timer = typing_speed
