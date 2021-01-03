extends Node

# -------------------- DECLARE VARIABLES --------------------

export var max_item_amount : int = 3

var current_item_amount : int = 0

var carried_items_ids : PoolIntArray = []


var banana = preload("res://Interactables/Items/Banana/ItemBanana.tscn")
var carrot = preload("res://Interactables/Items/Carrot/ItemCarrot.tscn")

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	pass

# -------------------- DECLARE FUNCTIONS --------------------

func add_item(item) -> void:
	carried_items_ids.append(item)


func pickup_item(item) -> bool:
	if current_item_amount >= max_item_amount:
		print("Maximum item amount reached!")
		return false
	else:
		current_item_amount += 1
		add_item(item)
		return true



onready var world : Spatial = get_tree().get_root().get_node("Main/World")
onready var player = world.get_node("Player")
func drop_item() -> void:
	if current_item_amount > -1 and carried_items_ids.size() > 0:
		print(carried_items_ids)

		var pre_instance = null
		match carried_items_ids[carried_items_ids.size() - 1]:
			1:
				print("Banana!")
				pre_instance = banana
			2:
				print("Carrot!")
				pre_instance = carrot
			_:
				print("_!")
				return
			
		var instance = pre_instance.instance()
		instance.transform.origin = player.transform.origin + Vector3(0, 5, 0)
		world.add_child(instance)
		print(instance)
		
		carried_items_ids.remove(carried_items_ids.size() - 1)
		current_item_amount -= 1
