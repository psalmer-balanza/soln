extends Node

var Enemy_HP = 100
var Current_HP = 100
var Question = false
var tilemap: TileMapLayer
var Question_Dictionary
signal questions_loaded

func _ready():
	var getquestions_url = "http://localhost:3000/soln/getquestions"
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

	var post_data = {
		"MinigameID": 1
		}
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
			Question_Dictionary = constructQuestionDictionary(response)
			# Emit signal once questions are loaded
			emit_signal("questions_loaded")
	else:
		print("HTTP request failed with code:", response_code)

func constructQuestionDictionary(response):
	Question_Dictionary = {}
	for i in range(response.size()):
		var question = response[i]
		Question_Dictionary[i + 1] = [
			question["question_text"], 
			question["option_1"], 
			question["option_2"], 
			question["option_3"], 
			question["option_4"], 
			question["correct_answer"]
		]
	return Question_Dictionary
