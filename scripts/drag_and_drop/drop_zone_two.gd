extends Area2D

# To store the reference of the currently dragged object dynamically
var clone_drag_and_drop : Node
@onready var drop_zone_two = $"."
var num_dropped_items: Array[Node] = []

func _ready():
	clone_drag_and_drop = null
	print("Drop zone two ready")

# When item stays in the zone, dynamically update the cloned object reference
func _on_area_entered(area):
	print("Reference of the current drop zone two: ", drop_zone_two)
	
	# Update reference dynamically
	clone_drag_and_drop = area
	print("Reference of the current cloned object from drop zone two: ", clone_drag_and_drop)

	# Check if the drop zone has overlapping areas and add item
	if drop_zone_two.has_overlapping_areas():
		DropZoneTwo.add_dropped_item(clone_drag_and_drop)
		add_dropped_item(clone_drag_and_drop)
	
	print("Number of dropped items: ", count_dropped_items())

# When an item leaves the drop zone, remove it from the dropped items
func _on_area_exited(area):
	remove_dropped_item(area)
	print("From drop zone exit two current count of drop items: ", count_dropped_items())

func count_dropped_items() -> int:
	print("Current number of dropped items: ", num_dropped_items)
	return num_dropped_items.size()

# Function to add an item to the drop zone
func add_dropped_item(item):
	if item not in num_dropped_items:
		num_dropped_items.append(item)
		print("Item added: ", item)

# Function to remove an item from the drop zone
func remove_dropped_item(item):
	if item in num_dropped_items:
		num_dropped_items.erase(item)
		print("Item removed: ", item)
