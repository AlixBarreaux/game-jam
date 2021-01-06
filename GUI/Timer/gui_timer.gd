extends Control

# -------------------- DECLARE VARIABLES --------------------

export var time_before_defeat : float = 300.0

var minutes : int = 0
var seconds : int = 0

onready var time_left_label : Label = $Panel/TimeLeftLabel

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
#	$DefeatTimer.set_wait_time(time_before_defeat)
#
#	$GUITimer.start()
#	$DefeatTimer.start()
	pass

# -------------------- DECLARE FUNCTIONS --------------------


func _on_GUITimer_timeout() -> void:
	time_before_defeat -= 1
	time_left_label.text = str(time_before_defeat)
