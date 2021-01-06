extends Node

# -------------------- DECLARE VARIABLES --------------------

var vertical_look_sensitivity : float = 0.01
var horizontal_look_sensitivity : float = 0.01

# --------------------  DECLARE SIGNALS  --------------------

signal sensitivity_changed

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())

# -------------------- DECLARE FUNCTIONS --------------------
