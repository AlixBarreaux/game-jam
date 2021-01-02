extends RigidBody

class_name Item

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	pass

# -------------------- DECLARE FUNCTIONS --------------------


func _on_Interactable_interaction_received() -> void:
	print("Interaction received by me: ", self.name)
