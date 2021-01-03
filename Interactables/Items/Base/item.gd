extends RigidBody

class_name Item

# -------------------- DECLARE VARIABLES --------------------

export var id : int = 0

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()

# -------------------- DECLARE FUNCTIONS --------------------

func _on_InteractableZone_interaction_received() -> void:
	print("Interaction received by me: ", self.name)
	if PlayerItemList.pickup_item(id):
		self.queue_free()


func initialize_asserts() -> void:
	assert(id != 0) 
