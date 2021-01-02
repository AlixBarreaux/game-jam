extends KinematicBody

class_name Player

# -------------------- DECLARE VARIABLES --------------------

# Movement
export var current_speed : float = 0.0

# Camera
export var horizontal_look_sensitivity : float = 0.1
export var vertical_look_sensitivity : float = 0.1

# Camera
var min_look_up_angle : int = -90
var max_look_up_angle : int = 90

var is_sprinting : bool = false

var direction : Vector3 = Vector3(0, 0, 0)
var velocity : Vector3 = Vector3(0, 0, 0)

var is_moving : bool = false


onready var head : Spatial = $Head
onready var camera : Camera = $Head/Camera

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	# Silence 2 errors move_and_slide returns value never used
	# warning-ignore: return_value_discarded
	# warning-ignore: return_value_discarded

	initialize_asserts()

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


var y_velocity : Vector3 = Vector3(0, 1, 0)
var max_gravity : float = 12
func _physics_process(_delta : float) -> void:
	self.move_and_slide(velocity, Vector3.UP)



# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	# Movement
	assert(current_speed > 0)

	assert(horizontal_look_sensitivity > 0.0)
	assert(vertical_look_sensitivity > 0.0)

	assert(min_look_up_angle != 0)
	assert(max_look_up_angle != 0)

func get_input() -> void:
	direction = Vector3(0, 0, 0)
	velocity = Vector3(0, 0, 0)


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

		# FIX DIAGONAL BACKWARD MOVEMENT: Backward takes over left and right
		# Even though left and right still have a little influence
		
		# Add gravity and jump
		
		# Optimize code with Input.is_action_strengh() - Input.is_act..
		# for vectors?



func _unhandled_input(event: InputEvent) -> void:
	get_input()

	# CHECK ALSO IF CURSOR SHOWN? If a GUI menu is opened
	if event is InputEventMouseMotion:
		# self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
		self.rotate_y(deg2rad(-event.relative.x * horizontal_look_sensitivity))
		head.rotate_x(deg2rad(-event.relative.y * vertical_look_sensitivity))


		# Clamp camera look to avoid funky rolling
		head.rotation.x = clamp(head.rotation.x, deg2rad(min_look_up_angle), deg2rad(max_look_up_angle))
