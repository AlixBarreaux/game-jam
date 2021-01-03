extends StaticBody

class_name Storage

# -------------------- DECLARE VARIABLES --------------------

export var accepted_item_id : int = 0
export var item_model_resource : PackedScene

onready var item_spot : Position3D = $ItemSpot

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	assert(accepted_item_id > 0)
	assert(item_model_resource != null)


func spawn_item() -> void:
	var instance = item_model_resource.instance()
	item_spot.add_child(instance)


func _on_InteractZone_interaction_received() -> void:
	print("Someone wants to put an item in my ass: ", self.name)
	print(PlayerItemList.carried_items_ids)
	
	var item_to_remove_index : int = -1
	
	for item_id in PlayerItemList.carried_items_ids:
		item_to_remove_index += 1
		
		if item_id == accepted_item_id:
			#Item accepted
			print(self.name, ": Item accepted: ", item_id)
			PlayerItemList.remove_item_from_inventory(item_to_remove_index)
			spawn_item()
			$InteractZone/CollisionShape.disabled = true
			break
		else:
			#Item rejected
			print(self.name, ": Item rejected!")
	
	# Reset the index to -1 to loop from 0 not out of bound of array
	item_to_remove_index = -1
