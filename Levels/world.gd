extends Spatial

# -------------------- DECLARE VARIABLES --------------------

export var camera_angle_y_rotation : float = 0.1

onready var items : Spatial = $Items
onready var furnitures : Spatial = $Furnitures
onready var storages = $Storages

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
	compare_items_and_storage_count()
	

func initialize_signals() -> void:
	# warning-ignore: return_value_discarded
	$CanvasLayer/MainMenu.connect("game_launched", self, "on_game_launched")


# Make sure the items amount = the storages amount to avoid having a storage
# empty on the map or an item on the ground while storages are full
func compare_items_and_storage_count() -> void:
	for storage in storages.get_children():
		WorldEvents.total_storages_amount += 1
		print("Total storages: ", WorldEvents.total_storages_amount)
		
	for item in items.get_children():
		WorldEvents.total_items_amount += 1
		print("Total items: ", WorldEvents.total_items_amount)
	
	if WorldEvents.total_storages_amount > WorldEvents.total_items_amount:
		printerr("ERROR: There are more storages than items!")
	elif WorldEvents.total_items_amount > WorldEvents.total_storages_amount:
		printerr("ERROR: There are more items than storages!")
	
	# If you have an error leading there look at the output log error!
	assert(WorldEvents.total_storages_amount == WorldEvents.total_items_amount)
	
	print("Successfully loaded items and storages!")
	print("Storages: ", WorldEvents.current_items_stored_amount, " / " , WorldEvents.total_storages_amount)
	print("Items: ", WorldEvents.current_items_amount, "/", WorldEvents.total_items_amount)


func on_game_launched() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Player/Head/Camera.current = true
	$Player.inputs_enabled = true
