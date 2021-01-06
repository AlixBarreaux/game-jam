extends Spatial

# -------------------- DECLARE VARIABLES --------------------

var total_track_number : int = 0

var unplayed_track_list : Array = []
var already_played_track_list : Array = []

# --------------------  DECLARE SIGNALS  --------------------



# --------------------   RUN THE CODE    --------------------



func _ready() -> void:
	initialize_signal()

	random_number_generator.randomize()

	for track in self.get_children():
		total_track_number += 1
		unplayed_track_list.append(track)

	count_unplayed_tracks_amount()


# -------------------- DECLARE FUNCTIONS --------------------

func initialize_signal() -> void:
	WorldEvents.connect("electricity_toggled", self, "on_electricity_toggled")
	
	for track in self.get_children():
		track.connect("finished", self, "on_track_finished")


func on_track_finished() -> void:
	play_random_track()





var unplayed_tracks_amount : int = 0
var max_unplayed_tracks_amount : int = 0

var random_number_generator = RandomNumberGenerator.new()
var random_track_number : int = 0

var current_played_track : AudioStreamPlayer3D = null

func count_unplayed_tracks_amount() -> void:
	max_unplayed_tracks_amount = unplayed_track_list.size()
	unplayed_tracks_amount = max_unplayed_tracks_amount


func play_random_track() -> void:
	if unplayed_track_list == []:
		reset_tracks()
	
#	print("BEFORE PLAYING RANDOMLY: ", unplayed_track_list)
#	print("Unplayed tracks amount before playing randomly: ", unplayed_tracks_amount)
	
	random_track_number = random_number_generator.randi_range(0, unplayed_tracks_amount -1)
	
	current_played_track = unplayed_track_list[random_track_number]
	current_played_track.play()
	
	unplayed_tracks_amount -= 1
	already_played_track_list.append(unplayed_track_list[random_track_number])
	unplayed_track_list.remove(random_track_number)
#	print("Unplayed track list after play random track: ", unplayed_track_list)


func reset_tracks() -> void:
#	print("Resetting tracks!")
#	print("ABOUT TO TAKE FROM ALREADY PLAYED LIST: ", already_played_track_list)
	for track in already_played_track_list:
		unplayed_track_list.append(track)

	already_played_track_list = []
	
	unplayed_tracks_amount = max_unplayed_tracks_amount
	
#	print("unplayed_track_list after reset: ", unplayed_track_list)


func on_electricity_toggled(toggled: bool) -> void:
	if toggled:
#		print(self.name, " is now enabled!")
		play_random_track()
	else:
#		print(self.name, " is now disabled!")
		current_played_track.stop()
		reset_tracks()
