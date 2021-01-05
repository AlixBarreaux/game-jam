extends Furniture

class_name ElectricCommand

# -------------------- DECLARE VARIABLES --------------------

export var is_enabled = false

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func _on_Interactable_interaction_received() -> void:
	if self.is_enabled:
		self.is_enabled = false
		WorldEvents.is_electricity_turned_on = false
	else:
		self.is_enabled = true
		WorldEvents.is_electricity_turned_on = true
