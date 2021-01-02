extends Node

class_name Interactable

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

signal interaction_received

# --------------------   RUN THE CODE    --------------------


# -------------------- DECLARE FUNCTIONS --------------------

func receive_interaction() -> void:
	emit_signal("interaction_received")
