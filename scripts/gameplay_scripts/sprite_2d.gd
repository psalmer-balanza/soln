extends Node2D

var drag = false
var drop_pos
var drop_nodes = []

func _ready():
	drop_nodes = get_tree().get_nodes_in_group("zone")
	drop_pos = drop_nodes[0].global_position
	drop_nodes[0].select()

func _on_Area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		drag = true

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if drag:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			drag = false
			var short_dis = 100
			for c in drop_nodes:
				var pos = global_position.distance_to(c.global_position)
				if pos < short_dis:
					c.select()
					drop_pos = c.global_position
					short_dis = pos
