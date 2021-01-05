extends Node

# -------------------- DECLARE VARIABLES --------------------

var win_conditions_met : bool = false

# TO BE IMPLEMENTED

var door_closed_amount : int = 0
var total_door_amount : int = 0

var are_all_items_stored : bool = false
var are_all_doors_closed : bool = false
var is_electricity_turned_on : bool = false

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func check_if_all_doors_closed() -> void:
	if door_closed_amount == total_door_amount:
		are_all_doors_closed = true
	else:
		are_all_doors_closed = false


func check_if_win_conditions_met() -> void:
	if not are_all_doors_closed:
		win_conditions_met = false
		print("Who left my store's doors opened?!")

	if not are_all_items_stored:
		win_conditions_met = false
		print("What the... What are all these items on the ground?!")

	if not is_electricity_turned_on:
		win_conditions_met = false
		print("Since when is there no electricity there? Are we in the stone age now?!")


func _on_game_over() ->  void:
	if win_conditions_met:
		print("You won!")
	else:
		print("You are FIRED!")
