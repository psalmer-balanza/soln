extends Node

var player_badges = {}
var current_floor: String
var current_quest: String
var saved_scene: String
var saved_position: Vector2

signal saved_data_loaded
var url = "http://"+ Global.host_ip +":3000/game/getsavedata"

func _ready() -> void:
	pass # Replace with function body.

func load_save_data(student_id):
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	var post_data = {
		"student_id": student_id
	}
	
	var json_body = JSON.stringify(post_data)
	var headers = ["Content-type: application/json"]
		
	# execute POST request
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, json_body)
	if error != OK:
		print("error: unable to make request")

func _http_request_completed(_result, response_code, _headers, body):
	if response_code == 200:
		var json = JSON.new()
		var error = json.parse(body.get_string_from_utf8())
		if error == OK:
			var response = json.get_data()
			player_badges = response.player_badges
			current_floor = response.current_floor
			current_quest = response.current_quest
			saved_scene = response.saved_scene
			saved_position = Vector2(response.vector_x, response.vector_y)
			emit_signal("saved_data_loaded")
	else:
		print("HTTP request failed with code: error in get save data", response_code)
