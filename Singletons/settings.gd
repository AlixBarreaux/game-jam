extends Node

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())

# -------------------- DECLARE FUNCTIONS --------------------
