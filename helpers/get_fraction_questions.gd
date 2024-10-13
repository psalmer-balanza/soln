extends Node

signal questions_loaded

var fraction_questions = []
var post_data = {"MinigameID": 1}

func _ready():
	var getquestions_url = "http://localhost:3000/game/getfractions"
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

	var json_body = JSON.stringify(post_data)
	var headers = ["Content-type: application/json"]
	
	# execute POST request
	var error = http_request.request(getquestions_url, headers, HTTPClient.METHOD_POST, json_body)
	if error != OK:
		print("error: unable to make request")
		
# Called when the HTTP request is completed.
func _http_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		var json = JSON.new()
		var error = json.parse(body.get_string_from_utf8())
		if error == OK:
			var response = json.get_data()
			fraction_questions = constructFractionQuestions(response)
			# Emit signal once questions are loaded
			emit_signal("questions_loaded")
	else:
		print("HTTP request failed with code: error in get fractions", response_code)

func constructFractionQuestions(response):
	fraction_questions = []
	for i in range(response.size()):
		var fraction = response[i]
		fraction_questions.append([fraction["fraction1_numerator"], fraction["fraction1_denominator"],
									fraction["fraction2_numerator"], fraction["fraction2_denominator"],
									"+", fraction["question_id"]])
	return fraction_questions
