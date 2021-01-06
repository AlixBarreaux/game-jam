extends Timer

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_signals() -> void:
	WorldEvents.connect("game_won", self, "on_game_won")


func on_game_won() -> void:
	self.stop()


func _on_DefeatTimer_timeout() -> void:
	print("What are you doing in here?!")
	WorldEvents.loose_game()
