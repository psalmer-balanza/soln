extends Node

var saisai_questions: Array = []
var robot_questions: Array = []
var racket_steal_questions: Array = []
var racket_house_questions: Array = []
var snekkers_questions: Array = []
var post_data = {}
var minigameID

signal questions_loaded

# Called when the node enters the scene tree for the first time.
# Load all the questions from the database
func _ready() -> void:
	pass
	

func get_saisai_questions():
	minigameID = 1
	post(minigameID)

func get_robot_questions():
	minigameID = 2
	post(minigameID)
	
func get_racket_steal_questions():
	minigameID = 3
	post(minigameID)

func get_racket_house_questions():
	minigameID = 4
	post(minigameID)
	
func get_snekkers_questions():
	minigameID = 5
	post(minigameID)
	
func post(minigameID):
	post_data["MinigameID"] = minigameID
	var url 
	
	if minigameID == 1 || minigameID == 2:
		url = "http://"+ Global.host_ip +":3000/game/getfractions"
	elif minigameID == 3 || minigameID == 4:
		url = "http://"+ Global.host_ip +":3000/game/getworded"
	elif minigameID == 5:
		url = "http://"+ Global.host_ip +":3000/game/getmcquestions"	

	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

	var json_body = JSON.stringify(post_data)
	var headers = ["Content-type: application/json"]
	
	# execute POST request
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, json_body)
	if error != OK:
		print("error: unable to make request")
		
# Called when the HTTP request is completed.
func _http_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		var json = JSON.new()
		var error = json.parse(body.get_string_from_utf8())
		if error == OK:
			var response = json.get_data()
			if minigameID == 1:
				saisai_questions = constructFractionQuestions(response)
				emit_signal("questions_loaded")
			elif minigameID == 2:
				robot_questions = constructFractionQuestions(response)
				emit_signal("questions_loaded")
			elif minigameID == 3:
				racket_steal_questions = constructWordedQuestions(response)
				emit_signal("questions_loaded")
			elif minigameID == 4:
				racket_house_questions = constructWordedQuestions(response)
				emit_signal("questions_loaded")
			elif minigameID == 5:
				snekkers_questions = constructQuizQuestions(response)
				emit_signal("questions_loaded")
	else:
		print("HTTP request failed with code: error in get fractions", response_code)

func constructFractionQuestions(response):
	var questions = []
	for i in range(response.size()):
		var fraction = response[i]
		questions.append([fraction["fraction1_numerator"], fraction["fraction1_denominator"],
									fraction["fraction2_numerator"], fraction["fraction2_denominator"],
									"+", fraction["question_id"]])
	return questions
	
	
func constructWordedQuestions(response):
	var questions = []
	for i in range(response.size()):
		var fraction = response[i]
		questions.append([fraction["question_text"], fraction["fraction1_numerator"],
									fraction["fraction1_denominator"], fraction["fraction2_numerator"],
									fraction["fraction2_denominator"], fraction["question_id"]])
	return questions

func constructQuizQuestions(response):
	var questions = []
	for i in range(response.size()):
		var question = response[i]
		questions += [[
			question["question_text"], 
			question["option_1"], 
			question["option_2"], 
			question["option_3"], 
			question["option_4"], 
			question["correct_answer"],
			question["question_id"]
			]]
		
	return questions
