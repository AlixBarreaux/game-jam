extends Area

class_name Interactable

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

signal interaction_received

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	assert(self.get("collision_layer") != 0)


func receive_interaction() -> void:
	emit_signal("interaction_received")
