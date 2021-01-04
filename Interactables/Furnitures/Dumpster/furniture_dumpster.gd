extends Furniture

class_name Dumpster

# -------------------- DECLARE VARIABLES --------------------

enum STATES {CLOSED=0, OPENED}
var current_state = STATES.CLOSED


# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	# Close the dumpster at start if opened
#	model.get_node("ModelDumpster/Body/DumpsterOpener").rotate_x(30)
	model.animation_player.play_backwards(model.animation_list[0])

# -------------------- DECLARE FUNCTIONS --------------------

func _check_current_state() -> void:
	match current_state:
		STATES.CLOSED:
			model.animation_player.play(model.animation_list[0])
			self.current_state = STATES.OPENED
		STATES.OPENED:
			model.animation_player.play_backwards(model.animation_list[0])
			self.current_state = STATES.CLOSED
		_:
			printerr("(!) ERROR in: ", self.name, " in method: check_current_state()")


func _on_Interactable_interaction_received() -> void:
	_check_current_state()

