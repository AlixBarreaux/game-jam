extends Spatial

# -------------------- DECLARE VARIABLES --------------------

onready var animation_player : AnimationPlayer = $AnimationPlayer

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()

# -------------------- DECLARE FUNCTIONS --------------------


func initialize_asserts() -> void:
	assert(animation_player != null)
