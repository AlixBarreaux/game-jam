extends Area

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------

func _on_AutomaticDoorDetector_body_entered(_body: PhysicsBody) -> void:
	self.get_parent().check_if_player_has_key()


func _on_AutomaticDoorDetector_body_exited(_body: Node) -> void:
	self.get_parent().check_if_player_has_key()
