extends Node

# -------------------- DECLARE VARIABLES --------------------

export var max_item_amount : int = 3

var current_item_amount : int = 0

var carried_items_ids : PoolIntArray = []
var carried_keys_ids : Array = []


var banana = preload("res://Interactables/Items/Banana/ItemBanana.tscn")
var carrot = preload("res://Interactables/Items/Carrot/ItemCarrot.tscn")
var canned_peas = preload("res://Interactables/Items/Canned_Peas/ItemCannedPeas.tscn")
var egg_carton_full = preload("res://Interactables/Items/Egg_Carton_Full/ItemEggCartonFull.tscn")
var milk = preload("res://Interactables/Items/Milk/ItemMilk.tscn")
var potato = preload("res://Interactables/Items/Potato/ItemPotato.tscn")
var tomato = preload("res://Interactables/Items/Tomato/ItemTomato.tscn")
var watermelon = preload("res://Interactables/Items/Watermelon/ItemWatermelon.tscn")
var strawberry = preload("res://Interactables/Items/Strawberry/ItemStrawberry.tscn")
var baguette = preload("res://Interactables/Items/Baguette/ItemBaguette.tscn")


onready var world : Spatial = get_tree().get_root().get_node("Main/World")
onready var world_items_node : Spatial = world.get_node("Items")
onready var player = world.get_node("Player")

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

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




func drop_item() -> void:
	if current_item_amount > -1 and carried_items_ids.size() > 0:
		print(carried_items_ids)

		var pre_instance = null
		match carried_items_ids[carried_items_ids.size() - 1]:
			1:
				pre_instance = banana
			2:
				pre_instance = carrot
			3:
				pre_instance = canned_peas
			4:
				pre_instance = egg_carton_full
			5:
				pre_instance = milk
			6:
				pre_instance = potato
			7:
				pre_instance = tomato
			8:
				pre_instance = watermelon
			9:
				pre_instance = strawberry
			10:
				pre_instance = baguette
			_:
				print("_!")
				return
		var instance = pre_instance.instance()
		instance.transform.origin = player.transform.origin + Vector3(0, 5, 0)
		world_items_node.add_child(instance)
		print(instance)
		
		carried_items_ids.remove(carried_items_ids.size() - 1)
		current_item_amount -= 1


# Delete item without dropping it into the world
func remove_item_from_inventory(index: int) -> void:
	print("Before change: ", carried_items_ids)
	carried_items_ids.remove(index)
	current_item_amount -= 1
	print("Remove in singleton! Carried item ids: ", carried_items_ids)
	print("Current_item_amount: ", current_item_amount)


func add_key(id: int) -> void:
	carried_keys_ids.append(id)
	print("Key addd in singleton. ID: ", id)
