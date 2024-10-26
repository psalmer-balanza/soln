extends Node

var minigameID: int
var questionID: int ## ARRAY MAYBE FOR STORING MULTIPLE VALUES
var current_username: String = PlayerState.player_username
var current_url: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func update_saisai_statistics(num_right_attempts, num_wrong_attempts):
	minigameID = 1
	questionID = 1 # NEEDS TO BE UPDATED 
	post_question_score(current_username, questionID, minigameID, num_right_attempts, num_wrong_attempts)

func update_dead_robot_statistics(num_right_attempts, num_wrong_attempts):
	minigameID = 2
	questionID = 2 # NEEDS TO BE UPDATED 
	post_question_score(current_username, questionID, minigameID, num_right_attempts, num_wrong_attempts)

func post_question_score(username, questionID, minigameID, num_right_attempts, num_wrong_attempts):
	if minigameID == 1:
		current_url = "http://"+ Global.host_ip +":3000/game/update/saisai/statistics"
	elif minigameID == 2:
		current_url = "http://"+ Global.host_ip +":3000/game/update/robot/statistics"

	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	var post_data = {
		"username": username,
		"question_id": questionID,
		"minigame_id": minigameID,
		"num_right_attempts": num_right_attempts,
		"num_wrong_attempts": num_wrong_attempts,
	}
	
	var json_body = JSON.stringify(post_data)
	var headers = ["Content-type: application/json"]
	
	# execute POST request
	var error = http_request.request(current_url, headers, HTTPClient.METHOD_POST, json_body)
	if error != OK:
		print("error: unable to make request")


func post(username, minigameID, score):
	var url = "http://"+ Global.host_ip +":3000/game/update/statistics"
	
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	var post_data = {
		"Username": username,
		"MinigameID": minigameID,
		"Score": score
	}
	
	var json_body = JSON.stringify(post_data)
	var headers = ["Content-type: application/json"]
	
	# execute POST request
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, json_body)
	if error != OK:
		print("error: unable to make request")
		
# Called when the HTTP request is completed.
func _http_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		print("statistic sent successfully")
	else:
		print("HTTP request failed with code: error in STATISTICS", response_code)
