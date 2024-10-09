extends Control

@onready var first_name = $StudentInformation/FirstName
@onready var last_name = $StudentInformation/LastName
@onready var username = $StudentInformation/Username
@onready var class_number = $StudentInformation/ClassNumber
@onready var class_section = $StudentInformation/ClassSection
@onready var password = $StudentInformation/Password
@onready var http_request: HTTPRequest = HTTPRequest.new()

var register_url = "http://localhost:3000/soln/register"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create an HTTP request node and connect its completion signal.
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)


func _on_register_button_button_down():
	var credentials = {
		"first_name": first_name.text,
		"last_name": last_name.text,
		"class_number": class_number.text,
		"class_section": class_section.text,
		"username": username.text,
		"password": password.text,
	}

	var json_body = JSON.stringify(credentials)
	print(json_body)
	var headers = ["Content-type: application/json"]
	
	# Perform a POST request. Rhe URL registers the input of the student to the database
	http_request.request(register_url, headers, HTTPClient.METHOD_POST, json_body)

# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	print("logic for registering")
