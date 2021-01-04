extends Control

# -------------------- DECLARE VARIABLES --------------------

var is_animation_at_end : bool = false

# --------------------  DECLARE SIGNALS  --------------------

signal game_launched

# --------------------   RUN THE CODE    --------------------

func _ready() -> void:
	_on_AnimationPlayer_animation_finished("VersionLabelAlphaModulate")
	$REMOVEIT.text = TranslationServer.get_locale_name(TranslationServer.get_locale())

# -------------------- DECLARE FUNCTIONS --------------------


func _on_PlayButton_pressed() -> void:
	self.visible = false
	emit_signal("game_launched")


func _on_OptionsButton_pressed() -> void:
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if is_animation_at_end:
		is_animation_at_end = false
		$AnimationPlayer.play_backwards(anim_name)
	else:
		is_animation_at_end = true
		$AnimationPlayer.play(anim_name)
		


func _on_MainMenu_visibility_changed() -> void:
	if self.visible:
		$VBoxContainer/PlayButton.grab_focus()
	else:
		$VBoxContainer/PlayButton.release_focus()
		
