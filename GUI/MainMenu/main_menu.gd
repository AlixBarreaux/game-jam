extends Control

# -------------------- DECLARE VARIABLES --------------------

var is_animation_at_end : bool = false

# --------------------  DECLARE SIGNALS  --------------------

signal game_launched

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	_on_AnimationPlayer_animation_finished("VersionLabelAlphaModulate")

# -------------------- DECLARE FUNCTIONS --------------------


func _on_PlayButton_pressed() -> void:
	self.visible = false
	WorldEvents.emit_signal("game_launched")


func _on_CreditsButton_pressed() -> void:
	$GUICredits.show()


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if is_animation_at_end:
		is_animation_at_end = false
		$AnimationPlayer.play_backwards(anim_name)
	else:
		is_animation_at_end = true
		$AnimationPlayer.play(anim_name)
		

# Self Visibility changed
func _on_MainMenu_visibility_changed() -> void:
	if self.visible:
		$VBoxContainer/PlayButton.grab_focus()
	else:
		$VBoxContainer/PlayButton.release_focus()
		for child in self.get_children():
			if not child is AnimationPlayer:
				child.release_focus()
		


func _on_GUICredits_visibility_changed() -> void:
	$VBoxContainer/PlayButton.grab_focus()




func _on_PCSensitivityApplyButton_pressed() -> void:
	Settings.pc_horizontal_look_sensitivity = $OptionsPanel/VBoxContainer3/VBoxContainer/PCSpinBox.value
	Settings.pc_vertical_look_sensitivity = $OptionsPanel/VBoxContainer3/VBoxContainer/PCSpinBox.value
	Settings.emit_signal("sensitivity_changed")


func _on_SensitivityApplyButton_pressed() -> void:
	Settings.horizontal_look_sensitivity = $OptionsPanel/VBoxContainer3/VBoxContainer2/ConsoleSpinBox.value
	Settings.vertical_look_sensitivity = $OptionsPanel/VBoxContainer3/VBoxContainer2/ConsoleSpinBox.value
	Settings.emit_signal("sensitivity_changed")
