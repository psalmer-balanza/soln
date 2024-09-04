extends Node2D

var has_hidden_rock = false

func _ready():
	# Check the state of the rock on start
	if State.rock_removed:
		hide_rock()

func _process(delta):
	if State.rock_removed and not has_hidden_rock:
		print("Rock removed from the path.")
		hide_rock()

func hide_rock():
	# Annotated by ChatGPT OpenAI
	$CollisionShape2D.disabled = true
	$Sprite2D.visible = false
	has_hidden_rock = true
	
