extends Spatial

# -------------------- DECLARE VARIABLES --------------------

export var camera_angle_y_rotation : float = 0.1

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()
	initialize_signals()


func _physics_process(_delta: float) -> void:
	$PivotPoint.rotation_degrees.y += camera_angle_y_rotation

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	assert(camera_angle_y_rotation != 0)
	

func initialize_signals() -> void:
	# warning-ignore: return_value_discarded
	$CanvasLayer/MainMenu.connect("game_launched", self, "on_game_launched")


func on_game_launched() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Player/Head/Camera.current = true
	$Player.inputs_enabled = true
