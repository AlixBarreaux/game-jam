extends Spatial

class_name Furniture

"""
Base class for the furniture, be it animated or not.
Extend this scene when creating a new furniture.
Save the exported blender scene as a Godot Scene and add it as a child to
the Model Node here.
If there are animations, add a script to the newly created furniture and extend
from Furniture. Then bind the animations as you wish with your own functions.
"""

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
