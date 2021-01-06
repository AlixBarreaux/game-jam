extends Node

# -------------------- DECLARE VARIABLES --------------------

var pc_vertical_look_sensitivity : float = 0.1
var pc_horizontal_look_sensitivity : float = 0.1

var console_vertical_look_sensitivity : float = 2.5
var console_horizontal_look_sensitivity : float = 2.5

# --------------------  DECLARE SIGNALS  --------------------

signal pc_sensitivity_changed
signal console_sensitivity_changed

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())

# -------------------- DECLARE FUNCTIONS --------------------
