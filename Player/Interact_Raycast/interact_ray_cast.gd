extends RayCast

# -------------------- DECLARE VARIABLES --------------------

# The reference to the node the racast collides with
# Set to self to avoid setting it to null
var collider : Spatial = self

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	pass

func _physics_process(_delta : float) -> void:

	if self.is_colliding():
		collider = get_collider()
		if collider.has_method("receive_interaction"):
			self.enabled = false
			collider.receive_interaction()
#		else:
#			printerr("(!) ERROR: Collider doesn't have method receive_interaction!")


func _unhandled_key_input(_event: InputEventKey) -> void:
	if Input.is_action_just_pressed("interact"):
		self.enabled = true
	if Input.is_action_just_released("interact"):
		self.enabled = false

# -------------------- DECLARE FUNCTIONS --------------------
