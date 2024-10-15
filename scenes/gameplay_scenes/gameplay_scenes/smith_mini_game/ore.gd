extends CharacterBody2D

@onready var ores_inside = Global.ores_inside

var picked:bool = false

func  _process(delta: float) -> void:
	if picked:
		global_position = get_global_mouse_position()

func _on_button_pressed() -> void:
	move_to_front()
	if picked:
		if !ores_inside.find(self):
			self.queue_free()
		picked = false
	else:
		picked = true

func _is_inside():
	ores_inside.find(self)
