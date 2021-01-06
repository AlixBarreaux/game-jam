extends Control

# -------------------- DECLARE VARIABLES --------------------

export var win_text : String = "YOU WIN!"

onready var reason_label : Label = $Panel/ReasonLabel

onready var replay_button : Button = $Panel/ReplayButton
onready var victory_sound : AudioStreamPlayer = $VictorySound
onready var defeat_sound : AudioStreamPlayer = $DefeatSound

onready var animation_player : AnimationPlayer = $AnimationPlayer

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	initialize_signals()
	self.hide()


# -------------------- DECLARE FUNCTIONS --------------------

func initialize_signals() -> void:
	WorldEvents.connect("game_lost", self, "on_game_lost")
	WorldEvents.connect("game_won", self, "on_game_won")


func on_game_lost(reason: String) -> void:
	self.show()
	reason_label.text = "DEFEAT!\n\n" + reason
	defeat_sound.play()


func on_game_won() -> void:
	self.show()
	reason_label.text = win_text
	$SoundPlayerTimer.start()
	


func _on_GUIGameOver_visibility_changed() -> void:
	if self.visible:
		self.show()
		replay_button.grab_focus()
	else:
		self.hide()
		for child in self.get_children():
			if child is Control:
				child.release_focus()


func _on_SoundPlayerTimer_timeout() -> void:
	victory_sound.play()
	animation_player.play("win_animation")
