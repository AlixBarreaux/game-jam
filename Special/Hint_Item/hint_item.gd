extends Spatial

# -------------------- DECLARE VARIABLES --------------------

export var is_visible : bool = false
export var visibility_transition_time : float = 0.5

# Check if player entered the area at least one time
var was_triggered_once : bool = false

onready var area : Area = $Area
onready var sprite3D : Sprite3D = $Sprite3D
onready var tween : Tween = $Tween


# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()
	
	sprite3D.set_modulate(Color(1, 1, 1, 0))


func _physics_process(_delta : float) -> void:
	pass

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	assert(sprite3D.texture != null)
	assert(visibility_transition_time > 0)


func toggle_sprite_visible() -> void:
	if is_visible:
		is_visible = false
		hide_sprite3D()
	else:
		is_visible = true
		show_sprite3D()

# warning-ignore: return_value_discarded
# warning-ignore: return_value_discarded
# warning-ignore: return_value_discarded
func show_sprite3D() -> void:
	tween.stop_all()
	tween.interpolate_property(sprite3D, "modulate", sprite3D.get("modulate"), Color(1, 1, 1, 1), visibility_transition_time, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.start()


# warning-ignore: return_value_discarded
# warning-ignore: return_value_discarded
# warning-ignore: return_value_discarded
func hide_sprite3D() -> void:
	tween.stop_all()
	tween.interpolate_property(sprite3D, "modulate", sprite3D.get("modulate"), Color(1, 1, 1, 0), visibility_transition_time, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()


func _on_Area_body_entered(body: PhysicsBody) -> void:
	if body is Player:
		self.toggle_sprite_visible()


func _on_Area_body_exited(body: PhysicsBody) -> void:
	if body is Player:
		self.toggle_sprite_visible()
