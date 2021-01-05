extends Area

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	pass

# -------------------- DECLARE FUNCTIONS --------------------


func _on_WinArea_body_entered(body: Node) -> void:
	# Don't trust the collision mask, we don't have time anymore lol
	if body is Player:
		WorldEvents.check_if_win_conditions_met()
