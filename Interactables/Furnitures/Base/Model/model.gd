extends Spatial

# -------------------- DECLARE VARIABLES --------------------

onready var child : Spatial = self.get_child(0)

onready var animation_player : AnimationPlayer = null

var is_animated : bool = false
var animation_list : PoolStringArray = []

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_asserts()
	
	if self.child.has_node("AnimationPlayer"):
		animation_player = self.child.get_node("AnimationPlayer")
		
		is_animated = true
		animation_list = animation_player.get_animation_list()


# -------------------- DECLARE FUNCTIONS --------------------


func initialize_asserts() -> void:
	assert(child != null)
