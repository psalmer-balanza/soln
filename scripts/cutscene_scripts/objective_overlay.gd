extends Node2D
@onready var label: Label = $Label
var quest_status := {}

# Typewriter effect variables
@export var typing_speed := 0.05  # Speed of the typewriter effect
var typewriter_timer := 0.0
var current_characters := 0  # Tracks visible characters for the typewriter effect
var full_text := ""  # The full text to display

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
		"raket_sword_quest": false,
		"raket_worded": false,
		"raket_sword_pieces_complete": false,
		"face_the_snake": false,
		"snake_quiz_complete": false,
		"you_may_leave_floor_1": false,
		"placeholder_93123": false,
		"placeholder_812133": false,
		"placeholder_93121233": false,
		"placeholder_10": false
	}
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cq = DialogueState.current_quest
	match cq:
		"movable_rock":
			handle_quest_label(cq, "Remove the rock in your path.")
		"movable_rock_done":
			handle_quest_label(cq, "Learn more about these \"fractions.\"")
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
		"raket_worded":
			handle_quest_label(cq, "Talk to Raket.")
		"raket_sword_quest":
			handle_quest_label(cq, "Find the sword materials in the cave.")
		"raket_sword_pieces_complete":
			handle_quest_label(cq, "Return to Raket with the sword materials.")
		"face_the_snake":
			handle_quest_label(cq, "Face Snekkers the Snake in the cave.")
		"snake_quiz_complete":
			handle_quest_label(cq, "Learn about the chosen one.")
		"you_may_leave_floor_1":
			handle_quest_label(cq, "Go to the sewer pipe.")
		"placeholder1":
			handle_quest_label(cq, "Learn more about these")
		"placeholder1":
			handle_quest_label(cq, "Learn more about these")
			
	# Typewriter effect update
	if current_characters < label.text.length():
		typewriter_timer -= delta
		if typewriter_timer <= 0:
			typewriter_timer = typing_speed
			current_characters += 1
			label.visible_characters = current_characters

func handle_quest_label(quest_name: String, objective_text: String) -> void:
	if not quest_status[quest_name]:
		quest_status[quest_name] = true
		#Put in new text
		label.text = "Current Objective: " + objective_text
		label.visible_characters = 0
		current_characters = 0
		typewriter_timer = typing_speed
