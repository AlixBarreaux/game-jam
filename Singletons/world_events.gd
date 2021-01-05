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

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func check_if_all_doors_closed() -> void:
	if door_closed_amount == total_door_amount:
		are_all_doors_closed = true
	else:
		are_all_doors_closed = false


func check_if_win_conditions_met() -> void:
	if not are_all_items_stored:
		win_conditions_met = false
		print("I have the feeling... Oh man... I forgot to store ALL the items!")
		return

	if not is_electricity_turned_on:
		win_conditions_met = false
		print("Since when is there no electricity there? Are we in the stone age now?! ...")
		print("OH NO! I have to reenable it!")
		return

	if not are_all_doors_closed:
		win_conditions_met = false
		print("The doors! CLOSE ALL THE DOORS!")
		return


func _on_game_over() ->  void:
	if win_conditions_met:
		win_game()
	else:
		loose_game()


func win_game() -> void:
	print("You won!")


func loose_game() -> void:
	print("You are FIRED!")
