extends Node

var addition_questions: Array = []
var subtraction_questions: Array = []

# Called when the node enters the scene tree for the first time.
# Load all the questions from the database
func _ready() -> void:
	
	# TODO replace with questions from the data base in the same format
	#addition_questions = [
		#[1, 2, 1, 2, "+", 1], # fraction addition questions
		#[1, 3, 1, 2, "+", 2],
		#[2, 5, 1, 2, "+", 3],
		#
		#["what is 1/2 + 1/2", 1, 2, 1, 2, "+", 4], #worded questions
		#["what is 1/3 + 1/3", 1, 3, 1, 3, "+", 5],
		#
		#["what is 1/4 + 1/4?", "2/4", "1/3", "2/2", "1/2", "+", 6], #quiz questions
	#]
	#subtraction_questions = [
		#[2, 3, 1, 3, "-"],
		#[4, 5, 1, 2, "-"],
		#[2, 5, 1, 4, "-"]
	#]
	addition_questions = []
	compile_addition_questions()

var fraction_questions = []
var worded_questions = []
var mc_questions = []

func compile_addition_questions():
	get_fraction_questions(1)
	get_fraction_questions(2)
	await get_tree().create_timer(1).timeout # some delay to have all the http requests finish
	
	addition_questions = fraction_questions
	print("start of addition_questions loaded")
	print(addition_questions)
	print("end of addition_questions")


func get_fraction_questions(minigame_id):
	GetFractions.connect("questions_loaded", _on_fraction_questions_loaded)
	GetFractions.post_data["MinigameID"] = minigame_id
	GetFractions.post()
	
func _on_fraction_questions_loaded():
	fraction_questions.append(GetFractions.fraction_questions) 
	
func get_worded_questions(minigame_id):
	GetWorded.connect("questions_loaded", _on_worded_questions_loaded)
	GetWorded.post_data["MinigameID"] = minigame_id
	GetWorded.post()
	
func _on_worded_questions_loaded():
	worded_questions.append(GetWorded.worded_questions)
	
func get_multiple_choice_questions(minigame_id):
	GetQuiz.connect("questions_loaded", _on_mc_questions_loaded)
	GetQuiz.post_data["MinigameID"] = minigame_id
	GetQuiz.post()
	
func _on_mc_questions_loaded():
	mc_questions.append(GetQuiz.mc_questions) 
