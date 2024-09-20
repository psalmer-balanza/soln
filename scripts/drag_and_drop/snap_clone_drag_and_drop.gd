extends Sprite2D

## CHALLENGE 1: REWORK RE-PICKING OF ITEMS (DONE) (BUG SEARCHING)

## BUG 1: UNSTABLE DROPPING OF ITEM (FIXED)
## BUG 2: WHEN THE CLONED ITEMS GETS TOO CLOSE THEY BECOME ONE ITEM (PARTIAL FIXED)

@onready var drag_logic = $DragLogic

var drop_zones
var MIN_DISTANCE = 50  # Minimum distance between objects
var is_dragging = false  # To check if the object is currently being dragged

func _ready():
	print("snap item ready")
	drop_zones = get_tree().get_nodes_in_group("drop_zone_group")

# For detecting the position of the cloned item
func _process(delta):
	if is_dragging:
		var mouse_tile = Global.tilemap.local_to_map(get_global_mouse_position())
		global_position = Global.tilemap.map_to_local(mouse_tile)

		# Check for nearby objects and prevent overlapping
		for other_item in get_tree().get_nodes_in_group("draggable_items_group"):
			if other_item != self:
				var distance = global_position.distance_to(other_item.global_position)
				if distance < MIN_DISTANCE:
					# Push the object away to avoid attachment
					var direction = (global_position - other_item.global_position).normalized()
					global_position += direction * (MIN_DISTANCE - distance)

# Enable dropping and repicking of item
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			# Start dragging if left mouse button is pressed and mouse is over the item
			if event.pressed and not is_dragging:
				if get_rect().has_point(to_local(get_global_mouse_position())):
					is_dragging = true
					set_process(true)
			# Stop dragging when left mouse button is released
			elif not event.pressed and is_dragging:
				is_dragging = false
				set_process(false)

# Signal to detect mouse click on the item
func _on_area_2d_input_event(viewport, event, shape_idx):
	drag_logic.object_held_down(event)
