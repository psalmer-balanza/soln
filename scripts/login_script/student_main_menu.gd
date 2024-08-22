extends Control

@onready var username: LineEdit = $StudentInformation/Username
@onready var password: LineEdit = $StudentInformation/Password
@onready var http_request: HTTPRequest = HTTPRequest.new()

func _on_login_button_button_down():
	var credentials = {
		"username": username.text,
		"password": password.text
	}
	
	var json_body = JSON.stringify(credentials)
	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	# Perform a POST request. The URL below returns JSON as of writing.
	#var body = JSON.new().stringify({"Username": "user3", "Password": "password_hash3"})
	var error = http_request.request("http://localhost:3000/soln/login", [], HTTPClient.METHOD_POST, json_body)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var json = JSON.new()
		var error = json.parse(body.get_string_from_utf8())
		if error == OK:
			var response = json.get_data()
			if response.success:
				print("Login successful")
				get_tree().change_scene_to_file("res://scenes/floors_scenes/floor_one.tscn")
			else:
				print("Login failed")
		else:
			print("Failed to parse JSON")
	else:
		print("HTTP request failed with code:", response_code)
