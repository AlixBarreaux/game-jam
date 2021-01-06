extends Node

"""
Handles all the events happening in the world and the win conditions.
Each storage, item door spawn and raise the counters stored here.
The electric command pannel toggles ON/OFF the electricity here.
"""

# -------------------- DECLARE VARIABLES --------------------

var win_conditions_met : bool = false

# TO BE IMPLEMENTED

var door_closed_amount : int = 0
var total_door_amount : int = 0


var current_items_stored_amount : int = 0
var total_storages_amount : int = 0

var current_items_amount : int = 0
var total_items_amount : int = 0


var are_all_items_stored : bool = false
var are_all_doors_closed : bool = false
var is_electricity_turned_on : bool = false

# --------------------  DECLARE SIGNALS  --------------------

signal game_launched
signal game_finished
signal game_won
signal game_lost

signal electricity_toggled

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func check_if_all_doors_closed() -> void:
	if door_closed_amount == total_door_amount:
		are_all_doors_closed = true
	else:
		are_all_doors_closed = false


func check_if_all_items_are_in_storages() -> void:
	if current_items_stored_amount == total_items_amount:
		are_all_items_stored = true
	else:
		are_all_items_stored = false
		

func check_if_win_conditions_met() -> void:
	check_if_all_items_are_in_storages()
	if not are_all_items_stored:
		win_conditions_met = false
		loose_game("You know your boss is a maniac?\nI think you forgot to store ALL the items!\nIn short: The chances of you getting fired are now 99.99% .\nJust saying!")
		return

	if is_electricity_turned_on:
		win_conditions_met = false
		loose_game("I love this music... Wait you did you disable it?\nOH-MY-GOD! Good bye job!")
		return

	check_if_all_doors_closed()
	if not are_all_doors_closed:
		win_conditions_met = false
		loose_game("You didn't close ALL the doors...\nVery discrete indeed!")
		return
	
	win_game()


#func on_game_over() ->  void:
#	if win_conditions_met:
#		win_game()
#	else:
#		loose_game()


func win_game() -> void:
	print("You won!")
	emit_signal("game_won")
	emit_signal("game_finished")


func loose_game(reason: String) -> void:
	emit_signal("game_lost", reason)
	emit_signal("game_finished")

