extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

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
