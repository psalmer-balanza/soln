extends CharacterBody2D

var picked:bool = false

func  _physics_process(delta: float) -> void:
	if !picked:
		return
	global_position = get_global_mouse_position()

func _on_ingredient_pressed() -> void:
	move_to_front()
	if picked:
		picked = false
	else:
		picked = true
