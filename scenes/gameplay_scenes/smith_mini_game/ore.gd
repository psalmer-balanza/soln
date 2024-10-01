extends CharacterBody2D

@onready var ores_inside = Global.ores_inside

var picked:bool = false
var inside:bool = false

func  _physics_process(delta: float) -> void:
	if !picked:
		return
	global_position = get_global_mouse_position()

func _on_ore_pressed() -> void:
	move_to_front()
	if picked && !inside:
		picked = false
	elif picked && inside:
		picked = false
		ores_inside += 1
		queue_free()
	else:
		picked = true



func _on_melting_pot_body_entered(body: Node2D) -> void:
	inside = true


func _on_melting_pot_body_exited(body: Node2D) -> void:
	inside = false
