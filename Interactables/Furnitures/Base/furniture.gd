extends Spatial

class_name Furniture

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func _ready() -> void:
	pass


func _on_Interactable_interaction_received() -> void:
	print("Furniture ", self.name, "received interaction from zone.")
