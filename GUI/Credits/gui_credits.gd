extends Panel

# -------------------- DECLARE VARIABLES --------------------

# --------------------  DECLARE SIGNALS  --------------------

# --------------------   RUN THE CODE    --------------------

# -------------------- DECLARE FUNCTIONS --------------------


func _on_GurjasStudioLinkButton_pressed() -> void:
	# warning-ignore: return_value_discarded
	OS.shell_open("https://www.artstation.com/gurjasstudios")


func _on_CtnPhacoLinkButton_pressed() -> void:
	# warning-ignore: return_value_discarded
	OS.shell_open("https://ctn-phaco.itch.io")


func _on_BackButton_pressed() -> void:
	self.hide()


func _on_GUICredits_visibility_changed() -> void:
	if self.visible:
		$BackButton.grab_focus()
	else:
		self.release_focus()
		for child in self.get_children():
			child.release_focus()
