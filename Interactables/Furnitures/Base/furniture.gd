extends Spatial

class_name Furniture

# -------------------- DECLARE VARIABLES --------------------

onready var model : Spatial = $Model
onready var model_animation_player : AnimationPlayer = null


# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	if model.animation_player != null:
		self.model_animation_player = model_animation_player

# -------------------- DECLARE FUNCTIONS --------------------

# To implement if there are animations
func _check_current_state() -> void:
	pass


func _on_Interactable_interaction_received() -> void:
	print("Furniture ", self.name, "received interaction from zone.")
