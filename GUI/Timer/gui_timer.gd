extends Control

# -------------------- DECLARE VARIABLES --------------------


var minutes : int = 0
var seconds : int = 0

onready var time_left_label : Label = $Panel/TimeLeftLabel
onready var few_time_left_sound : AudioStreamPlayer = $FewTimeLeftSound

# Timers
onready var defeat_timer : Timer = $DefeatTimer
onready var few_time_left_timer : Timer = $FewTimeLeftTimer
onready var gui_timer : Timer = $GUITimer

onready var time_before_defeat : float = $DefeatTimer.wait_time

onready var texture_progress : TextureProgress = $Panel/TextureProgress

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_texture_progress_values()
	initialize_asserts()
	initialize_signals()
	
#	$DefeatTimer.set_wait_time(time_before_defeat)
#
#	$GUITimer.start()
#	$DefeatTimer.start()
	pass

# -------------------- DECLARE FUNCTIONS --------------------

func initialize_asserts() -> void:
	assert(few_time_left_timer.wait_time < defeat_timer.wait_time)
	assert(texture_progress.min_value == 0)
	assert(texture_progress.value > 0)
	assert(texture_progress.max_value > 0)
	

func initialize_signals() -> void:
	WorldEvents.connect("game_launched", self, "on_game_launched")
	WorldEvents.connect("game_finished", self, "on_game_finished")


func initialize_texture_progress_values() -> void:
	texture_progress.max_value = defeat_timer.wait_time
	texture_progress.value = texture_progress.max_value
	
	time_left_label.text = str(texture_progress.value)


func on_game_launched() -> void:
	print("GAME LAUNCHED!")
	few_time_left_timer.start()
	defeat_timer.start()
	gui_timer.start()
	


func on_game_finished() -> void:
	print("Game finished in GUITimer!")
	defeat_timer.stop()
	few_time_left_timer.stop()
	few_time_left_sound.stop()


func _on_GUITimer_timeout() -> void:
	time_before_defeat -= 1
	time_left_label.text = str(time_before_defeat)
	
	texture_progress.value -= 1


func _on_FewTimeLeftTimer_timeout() -> void:
	few_time_left_sound.play()
