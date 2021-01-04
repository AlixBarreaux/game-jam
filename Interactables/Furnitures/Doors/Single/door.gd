extends Furniture

class_name Door

# -------------------- DECLARE VARIABLES --------------------

enum STATES {CLOSED=0, OPENED}
var current_state = STATES.CLOSED

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_signals()

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_signals() -> void:
	# warning-ignore:RETURN_VALUE_DISCARDED
	$Interactable.connect("interaction_received", self, "on_interaction_received")


func on_interaction_received() -> void:
	print("Door activated!")
