extends Furniture

class_name Door

# -------------------- DECLARE VARIABLES --------------------

export var required_key_id : int = 0

enum STATES {CLOSED=0, OPENED}
var current_state = STATES.CLOSED

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()
	initialize_signals()

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	assert(required_key_id > 0)


func initialize_signals() -> void:
	# warning-ignore:RETURN_VALUE_DISCARDED
	$Interactable.connect("interaction_received", self, "on_interaction_received")


func on_interaction_received() -> void:
	check_if_player_has_key()


func check_if_player_has_key() -> void:
	for key in PlayerItemList.carried_keys_ids:
		if key == self.required_key_id:
			print("The player has the key to open me: ", self.name)
			break
		else:
			print("The player doesn't have the key to open me: ", self.name)
