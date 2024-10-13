extends Node

var addition_questions: Array = []
var subtraction_questions: Array = []

# Called when the node enters the scene tree for the first time.
# Load all the questions from the database
func _ready() -> void:
	
	# TODO replace with questions from the data base in the same format
	addition_questions = [
		[1, 2, 1, 2, "+"],
		[1, 3, 1, 2, "+"],
		[2, 5, 1, 2, "+"]
	]
	subtraction_questions = [
		[2, 3, 1, 3, "-"],
		[4, 5, 1, 2, "-"],
		[2, 5, 1, 4, "-"]
	]
