extends CharacterBody2D

var menu_state = "idle"

func _physics_process(delta):
	# Idle state animation
	if menu_state == "idle":
		$Soln_background.play("idle")
