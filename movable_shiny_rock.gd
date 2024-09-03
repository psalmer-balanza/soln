extends Node2D

func _ready():
	# Check the state of the rock on start
	if State.rock_removed:
		hide_rock()

func _process(delta):
	# Continuously check if the rock should be removed
	if State.rock_removed:
		hide_rock()

func hide_rock():
	# Function to hide or remove the rock
	$CollisionShape2D.disabled = true # Disable the collision
	$Sprite2D.visible = false  # Hide the rock sprite
	print("Rock removed from the path.")
