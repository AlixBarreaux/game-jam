extends RigidBody

class_name Item

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func _on_InteractableZone_interaction_received() -> void:
	print("Interaction received by me: ", self.name)
