extends Node

# openlabserver is 30.30.28.52
var host_ip = "localhost"

# to know if the game is on online or offline mode
var is_online = false # set to true if student logs into online mode

# classroomID of a student
var classroomID

var current_floor = 1

# for smithing mini game
var ores_inside:int = 0

# for snekkers battle scene
var Enemy_HP = 100
var Current_HP = 100
var Question = false
var tilemap: TileMapLayer
var total_score

var user_energy = 3

# tutorial
var is_simplified_tutorial: bool = false

func _process(delta: float) -> void:
	if user_energy == 0:
		get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
		user_energy = 3


func choose_question(question_array_size: Array) -> int:
	return RandomNumberGenerator.new().randi_range(0, question_array_size.size()) - 1


# 1st parameter: Array of questions to be chosen
# 2nd parameter: Array of chosen questions
# 3rd parameter: Track the questions that have been chosen
func randomize_questions(questions_array: Array, current_chosen_questions: Array, chosen_index_questions: Array[int]) -> Array:
	var is_chosen = false
	
	while chosen_index_questions.size() != 3:
		var random_number_question = choose_question(questions_array)
		
		for current_chosen_index_question in chosen_index_questions:
			if current_chosen_index_question == random_number_question:
				is_chosen = true
		
		# If already added question dont add
		if is_chosen:
			print("Question already added")
			is_chosen = false
			
		# Add if question is new
		else: 
			chosen_index_questions.append(random_number_question)
			current_chosen_questions.append(questions_array[random_number_question])
	
	return current_chosen_questions
	print("Current chosen questions are ", current_chosen_questions)
