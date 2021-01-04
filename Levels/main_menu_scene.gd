extends Spatial

# -------------------- DECLARE VARIABLES --------------------

export var camera_angle_y_rotation : float = 0.1

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()


func _physics_process(_delta: float) -> void:
	$PivotPoint.rotation_degrees.y += camera_angle_y_rotation

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	assert(camera_angle_y_rotation != 0)
