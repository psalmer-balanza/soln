extends Control

@onready var username: LineEdit = $StudentInformation/Username
@onready var password: LineEdit = $StudentInformation/Password
@onready var http_request: HTTPRequest = HTTPRequest.new()

var login_url = "http://localhost:3000/game/login"

func _ready():
	# Create an HTTP request node and connect its completion signal.
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

func _on_login_button_button_down():
	print("username: " + username.text + " " + "password: " + password.text)
	var credentials = {
		"username": username.text,
		"password": password.text
	}
	
	var json_body = JSON.stringify(credentials)
	var headers = ["Content-type: application/json"]
	
	# Perform a POST request. The URL below returns JSON as of writing.
	http_request.request(login_url, headers, HTTPClient.METHOD_POST, json_body)

# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var json = JSON.new()
		var error = json.parse(body.get_string_from_utf8())
		if error == OK:
			var response = json.get_data()
			# RESPONSE IS RETURNING FALSE EVEN THOUGH THE LOGIN IS SUCCESSFUL
			if !response.success:
				print("Login successful")
				PlayerState.player_username = username.text
				get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
				#get_tree().change_scene_to_file("res://scenes/gameplay_scenes/simple_fraction_gameplay/addition_fraction/fraction_sample_gameplay.tscn")
			else:
				print("Login failed")
		else:
			print("Failed to parse JSON")
	else:
		print("HTTP request failed with code:", response_code)
