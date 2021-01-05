extends Timer

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------


func _on_DefeatTimer_timeout() -> void:
	print("What are you doing in here?!")
	WorldEvents.loose_game()
