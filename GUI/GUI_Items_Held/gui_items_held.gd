extends Panel

# -------------------- DECLARE VARIABLES --------------------

onready var item_list_label : Label = $VBoxContainer/AmountLabel

var item_held_amount : int = 0

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	self.initialize_signals()

# -------------------- DECLARE FUNCTIONS --------------------


func initialize_signals() -> void:
	PlayerItemList.connect("item_picked_up", self, "on_item_picked_up")
	PlayerItemList.connect("item_removed", self, "on_item_removed")


func on_item_picked_up() -> void:
	item_held_amount += 1
	item_list_label.text = str(item_held_amount) + " / 3"


func on_item_removed() -> void:
	item_held_amount -= 1
	item_list_label.text = str(item_held_amount) + " / 3"
