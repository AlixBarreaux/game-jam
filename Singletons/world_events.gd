extends Node

# -------------------- DECLARE VARIABLES --------------------

var win_conditions_met : bool = false

var are_all_doors_closed : bool = false
var door_closed_amount : int = 0

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	pass


# -------------------- DECLARE FUNCTIONS --------------------

func check_if_win_conditions_met() -> void:
	if win_conditions_met:
		print("You won the game!")
	else:
		print("You lost the game!")
