extends KinematicBody

class_name Player

# -------------------- DECLARE VARIABLES --------------------

# Movement
export var current_speed : float = 10.0

# Camera
onready var pc_horizontal_look_sensitivity : float = Settings.pc_horizontal_look_sensitivity
onready var pc_vertical_look_sensitivity : float = Settings.pc_vertical_look_sensitivity

onready var console_horizontal_look_sensitivity : float = Settings.console_horizontal_look_sensitivity
onready var console_vertical_look_sensitivity : float = Settings.console_vertical_look_sensitivity

# Camera
var min_look_up_angle : int = -90
var max_look_up_angle : int = 90

var is_sprinting : bool = false

var direction : Vector3 = Vector3(0, 0, 0)
var velocity : Vector3 = Vector3(0, 0, 0)

var is_moving : bool = false
var inputs_enabled : bool = false
var action_inputs_enabled : bool = true


onready var head : Spatial = $Head
onready var camera : Camera = $Head/Camera

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	# Silence 2 errors move_and_slide returns value never used
	# warning-ignore: return_value_discarded
	# warning-ignore: return_value_discarded

	initialize_asserts()
	Settings.connect("pc_sensitivity_changed", self, "on_pc_sensitivity_changed")
	Settings.connect("console_sensitivity_changed", self, "on_console_sensitivity_changed")

#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta : float) -> void:
	self.move_and_slide(velocity, Vector3.UP)

	if inputs_enabled:
		# Experimental. Might not work since it was not tested (no controller owned)
		# Controller Inputs
		if Input.is_action_pressed("look_left"):
			self.rotate_y(deg2rad(1 * console_horizontal_look_sensitivity * delta))

		if Input.is_action_pressed("look_right"):
			self.rotate_y(deg2rad(-1 * console_horizontal_look_sensitivity * delta))
			
		if Input.is_action_pressed("look_up"):
			head.rotate_x(deg2rad(1 * console_vertical_look_sensitivity * delta))
			
		if Input.is_action_pressed("look_down"):
			head.rotate_x(deg2rad(-1 * console_vertical_look_sensitivity * delta))


# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	# Movement
	assert(current_speed > 0)

	assert(pc_horizontal_look_sensitivity > 0.0)
	assert(pc_vertical_look_sensitivity > 0.0)

	assert(min_look_up_angle != 0)
	assert(max_look_up_angle != 0)

func get_input() -> void:
	direction = Vector3(0, 0, 0)
	velocity = Vector3(0, 0, 0)
	
	if not inputs_enabled:
		return

	if Input.is_action_just_pressed("objectives"):
		if not $CanvasLayer/GUIObjectives.visible:
			$CanvasLayer/GUIObjectives.visible = true
			action_inputs_enabled = false
		else:
			$CanvasLayer/GUIObjectives.visible = false
			action_inputs_enabled = true

	if not action_inputs_enabled:
		return

	# Sprint Toggle
	if Input.get_action_strength("sprint"):
			is_sprinting = true
	if Input.is_action_just_released("sprint"):
			is_sprinting = false


	if Input.get_action_strength("move_left"):
		direction -= transform.basis.x

		velocity -= transform.basis.x

	if Input.get_action_strength("move_right"):
		direction += transform.basis.x

		velocity += transform.basis.x


	if Input.get_action_strength("move_forward"):
		direction -= transform.basis.z

		velocity -= transform.basis.z


	if Input.get_action_strength("move_backward"):
		direction += transform.basis.z

		velocity += transform.basis.z


	# Normalize vectors for same speed on diagonal movements
	direction = direction.normalized()

	if direction != Vector3(0, 0, 0):
		is_moving = true
	else:
		is_moving = false

	velocity *= current_speed

	
	if Input.is_action_just_pressed("drop_item"):
		PlayerItemList.drop_item()



func _unhandled_input(event: InputEvent) -> void:
	get_input()

	# CHECK ALSO IF CURSOR SHOWN? If a GUI menu is opened
	if event is InputEventMouseMotion:
		# Look Left/Right
		self.rotate_y(deg2rad(-event.relative.x * pc_horizontal_look_sensitivity))
		# Look Up/Down
		head.rotate_x(deg2rad(-event.relative.y * pc_vertical_look_sensitivity))

		# Clamp camera look to avoid funky rolling
		head.rotation.x = clamp(head.rotation.x, deg2rad(min_look_up_angle), deg2rad(max_look_up_angle))



func on_pc_sensitivity_changed() -> void:
	self.pc_horizontal_look_sensitivity = Settings.pc_horizontal_look_sensitivity
	self.pc_vertical_look_sensitivity = Settings.pc_vertical_look_sensitivity


func on_console_sensitivity_changed() -> void:
	self.console_horizontal_look_sensitivity = Settings.console__horizontal_look_sensitivity
	self.console__vertical_look_sensitivity = Settings.console__vertical_look_sensitivity
