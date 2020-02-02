extends AudioStreamPlayer2D

const tracks = ['LvlMusic1', 'LvlMusic2', 'LvlMusic3']

func _ready():
	randomize()
	connect("finished", self, "play_random_song")
	play_random_song()

func play_random_song():
	randomize()
	var rand_nb = randi() % tracks.size()
	var audiostream = load("res://Music/" + tracks[rand_nb] + ".wav")
	set_stream(audiostream)
	play()
