extends RigidBody

class_name Item

"""
Base class for item represented in the 3D World.
The ID represents the ID used in the PlayerItemList singleton.
It is used to spawn the right item in the world and into the storages.
Be careful: If is_key is set to true, ID will not be used as an item ID but as
a KEY ID for doors. If it matches the door's required ID, it'll do what is in
the Door base Class.
"""


# -------------------- DECLARE VARIABLES --------------------

export var id : int = 0
export var is_key : bool = false

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()

# -------------------- DECLARE FUNCTIONS --------------------

func _on_InteractableZone_interaction_received() -> void:
	print("Interaction received by me: ", self.name)
	if not is_key:
		if PlayerItemList.pickup_item(id):
			self.queue_free()
	else:
		PlayerItemList.add_key(id)
		self.queue_free()


func initialize_asserts() -> void:
	assert(id > 0)
