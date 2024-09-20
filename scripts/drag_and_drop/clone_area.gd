extends Node2D

## CHALLENGE 1: HOW TO DRAG MULTIPLE ITEMS TO ONE DROPPABLE ZONE (DONE) (BUG SEARCHING)
## CHALLENGE 2: COUNTING THE NUMBER OF CLONED ITEMS IN THE DROP ZONE (DONE) (BUG SEARCHING)
## CHALLENGE 3: LIMITING OF ITEMS BASE ON THE CORRECT ANSWER OF FRACTION (DONE) (BUG SEARCHING)
## CHALLENGE 4: CLEARING OF ALL ITEMS (DONE) (BUG SEARCHING)
## CHALLENGE 5: CREATING A TRASH BIN FOR SINGLE CLEARING OF ITEM

## BUG 1: CLONED ITEMS IN DROP ZONE NOT BEING DELETED (FIXED)
## BUG 2: WHEN THE CLONED ITEMS GETS TOO CLOSE THEY BECOME ONE ITEM (PARTIAL FIXED)

var item = preload("res://scenes/gameplay_scenes/drag_and_drop/snap_clone_drag_and_drop.tscn")
var cloned_vase_items: Array[Node] = []
var clone_limit = 4 # Dynamically set limit base on the correct answer

func _ready():
	pass

# Cloning the item after left clicking the item
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("click"):
		print("left click")
		if cloned_vase_items.size() + 1 <= clone_limit: 
			print("cloned")
			var new_item = item.instantiate()
			add_child(new_item)

			#print("The reference for the new vase item is ", new_vase_item)
			cloned_vase_items.append(new_item)
			print("Current cloned item/s:",cloned_vase_items.size())
		else:
			print("Make warning that the cloned item is in limit")
			print("Current cloned item/s:",cloned_vase_items.size())


# Clearing all the items using a button
func _on_clear_button_button_down():
	print("Current vase items: ", cloned_vase_items.size())
	if cloned_vase_items.is_empty():
		print("MAKE A WARNING THAT THERE ARE NO CURRENT ITEMS")
		return

	# Iterate over the cloned_vase_items array and remove each item
	delete_array_items(cloned_vase_items)
	
	# Clear the array after removing all items
	cloned_vase_items.clear()
	
	# Re-initialize by getting the number of dropped items in a drop zone
	cloned_vase_items = DropZoneTwo.num_dropped_items

	if cloned_vase_items.is_empty():
		print("No items in drop zone")
		cloned_vase_items = []
		return
	else:
		print("Items cleared")
		cloned_vase_items = []
		return
	
	# Iterate over the cloned_vase_items array from drop zone and remove each item
	delete_array_items(cloned_vase_items)
	
	# Clear the array after removing all items
	cloned_vase_items.clear()
	
	if cloned_vase_items.size() == 0:
		print("Items cleared")

func delete_array_items(item_array: Array):
	for i in range(item_array.size()):
		var item = item_array[i]
		item.queue_free()  # This removes the item from the scene
		print("Item ", i, " deleted")

func add_cloned_item(item: Node) -> void:
	cloned_vase_items.append(item)
	#print("Item added to global array: ", item)

func get_cloned_items() -> Array:
	#print("Returning cloned items: ", cloned_vase_items)
	return cloned_vase_items
