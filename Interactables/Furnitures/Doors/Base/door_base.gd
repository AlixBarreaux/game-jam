extends Furniture

class_name Door

# -------------------- DECLARE VARIABLES --------------------

export var is_key_required : bool = false
export var required_key_id : int = 0

enum STATES {CLOSED=0, OPENED}
var current_state = STATES.CLOSED

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()
	initialize_signals()
	
	WorldEvents.total_door_amount += 1

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	if is_key_required:
		assert(required_key_id > 0)


func initialize_signals() -> void:
	# warning-ignore:RETURN_VALUE_DISCARDED
	$Interactable.connect("interaction_received", self, "on_interaction_received")


func on_interaction_received() -> void:
	check_if_player_has_key()


func _check_current_state() -> void:
	match current_state:
		STATES.CLOSED:
#			model.animation_player.play(model.animation_list[0])
			open()
			self.current_state = STATES.OPENED
			WorldEvents.door_closed_amount -= 1
		STATES.OPENED:
			close()
#			model.animation_player.play_backwards(model.animation_list[0])
			self.current_state = STATES.CLOSED
			WorldEvents.door_closed_amount += 1
		_:
			printerr("(!) ERROR in: ", self.name, " in method: check_current_state()")


func check_if_player_has_key() -> void:
	if is_key_required:
		for key in PlayerItemList.carried_keys_ids:
			if key == self.required_key_id:
				print("The player has the key to open or close me: ", self.name)
				_check_current_state()
				break
			else:
				_check_current_state()
				print("The player doesn't have the key to open or close me: ", self.name)
	else:
		_check_current_state()
		print("No key required, opening or closing!")


func open() -> void:
	model.animation_player.play(model.animation_list[0])


func close() -> void:
	model.animation_player.play_backwards(model.animation_list[0])
