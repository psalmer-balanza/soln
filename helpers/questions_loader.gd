extends Node

var saisai_questions: Array = []
var robot_questions: Array = []
var racket_steal_questions: Array = []
var racket_house_questions: Array = []
var snekkers_questions: Array = []

# Called when the node enters the scene tree for the first time.
# Load all the questions from the database
func _ready() -> void:
	
	# loads up the questions per npc, but is done asynchronously 
	# (give it a sec or two to finish up the http calls)
	get_saisai_questions()
	get_robot_questions()
	get_racket_stealing_questions()
	get_racket_house_questions_loaded()
	get_snekkers_questions()
	
	# TODO replace with questions from the data base in the same format
	#addition_questions = [
		#[1, 2, 1, 2, "+", 1], # fraction addition questions
		#[1, 3, 1, 2, "+", 2],
		#[2, 5, 1, 2, "+", 3]
	#]
	#subtraction_questions = [
		#[2, 3, 1, 3, "-"],
		#[4, 5, 1, 2, "-"],
		#[2, 5, 1, 4, "-"]
	#]
	
func get_saisai_questions():
	GetFractions.connect("questions_loaded", _on_saisai_questions_loaded)
	GetFractions.post_data["MinigameID"] = 1
	GetFractions.post()
	
func _on_saisai_questions_loaded():
	saisai_questions = GetFractions.fraction_questions
	#print(saisai_questions)
	
func get_robot_questions():
	GetFractions.connect("questions_loaded", _on_robot_questions_loaded)
	GetFractions.post_data["MinigameID"] = 2
	GetFractions.post()
	
func _on_robot_questions_loaded():
	robot_questions = GetFractions.fraction_questions
	#print(robot_questions)
	
func get_racket_stealing_questions():
	GetWorded.connect("questions_loaded", _on_racket_stealing_questions_loaded)
	GetWorded.post_data["MinigameID"] = 3
	GetWorded.post()

func _on_racket_stealing_questions_loaded():
	racket_steal_questions = GetWorded.worded_questions
	#print(racket_steal_questions)
	
func get_racket_house_questions_loaded():
	GetWorded.connect("questions_loaded", _on_racket_house_questions_loaded)
	GetWorded.post_data["MinigameID"] = 4
	GetWorded.post()

func _on_racket_house_questions_loaded():
	racket_house_questions = GetWorded.worded_questions
	#print(racket_house_questions)

func get_snekkers_questions():
	GetQuiz.connect("questions_loaded", _on_snekkers_questions_loaded)
	GetQuiz.post_data["MinigameID"] = 5
	GetQuiz.post()

func _on_snekkers_questions_loaded():
	snekkers_questions = GetQuiz.mc_questions
	#print(snekkers_questions)
