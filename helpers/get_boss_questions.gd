extends Node

# for boss battle scene
var Enemy_HP = 100
var Current_HP = 100
var Question = false
var tilemap: TileMapLayer
var mc_questions
signal questions_loaded
var post_data = { "MinigameID": 5 }

func post():
	var getquestions_url = "http://30.30.28.52:3000/game/getmcquestions"
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
			mc_questions = constructQuestionDictionary(response)
			# Emit signal once questions are loaded
			print("show smethings")
			print(mc_questions)
			emit_signal("questions_loaded")
			
	else:
		print("HTTP request failed with code: error in get boss?", response_code)

func constructQuestionDictionary(response):
	mc_questions = []
	for i in range(response.size()):
		var question = response[i]
		mc_questions += [[
			question["question_text"], 
			question["option_1"], 
			question["option_2"], 
			question["option_3"], 
			question["option_4"], 
			question["correct_answer"]
			]]
		
	return mc_questions

# for smithing mini game
var ores_inside:int = 0
