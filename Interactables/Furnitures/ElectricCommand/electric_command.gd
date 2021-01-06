extends Furniture

class_name ElectricCommand

# -------------------- DECLARE VARIABLES --------------------

export var is_enabled = false

onready var button_sound : AudioStreamPlayer3D = $ButtonSound
onready var electricity_arrival_timer : Timer = $ElectricityArrivalTimer

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	electricity_arrival_timer.start()

# -------------------- DECLARE FUNCTIONS --------------------

func _on_Interactable_interaction_received() -> void:
	button_sound.play()
	if self.is_enabled:
		self.is_enabled = false
		WorldEvents.is_electricity_turned_on = false
		WorldEvents.emit_signal("electricity_toggled", false)
	else:
		electricity_arrival_timer.start()


func _on_ElectricityArrivalTimer_timeout() -> void:
		self.is_enabled = true
		WorldEvents.is_electricity_turned_on = true
		WorldEvents.emit_signal("electricity_toggled", true)
	
