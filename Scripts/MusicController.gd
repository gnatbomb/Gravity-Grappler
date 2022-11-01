extends Node

# music load calls
var bgm = load("res://Res/Sound/GGBGM.mp3")
var title = load("res://Res/Sound/GGTitle.mp3")

# SE load calls
var star = load("res://Res/Sound/Star.ogg")
var asteroid = load("res://Res/Sound/Asteroid.ogg")
var well = load("res://Res/Sound/Well.ogg")

#var death = load("res://SE/DeathScream.ogg")
#var steppy = load("res://SE/Footsteps.ogg")
#var jump = load("res://SE/Jump.ogg")
#var land = load("res://SE/Landing.ogg")
#var embrace = load("res://SE/LoversEmbrace.ogg")
#var close = load("res://SE/MenuClose.ogg")
#var open = load("res://SE/MenuOpen.ogg")
#var respawn = load("res://SE/Respawn.ogg")
#var owie = load("res://SE/SpikeTouchYEOWCH.ogg")
#var spring = load("res://SE/Spring.ogg")
#var swap = load("res://SE/Swap.ogg")


# SE dict
var sounds = {
	"star": star,
	"asteroid": asteroid
}
#	"death": death,
#	"steppy": steppy,
#	"jump": jump,
#	"land": land,
#	"embrace": embrace,
#	"close": close,
#	"open": open,
#	"respawn": respawn,
#	"owie": owie,
#	"swap": swap
#}

# Audioplayer array
var AudioPlayers = []

var pitchdif = 0.1

# plays a given sound effect with pitch shift based on player. Call with player = 0 for no pitch shift
func play_SE(noise):
	for n in AudioPlayers.size():
		if (! AudioPlayers[n].is_playing()):
			AudioPlayers[n].stream = sounds[noise]
			AudioPlayers[n].play()
			break

func play_well(val):
	if val:
		if (! $Well.is_playing()):
			$Well.play()
	else:
		if ($Well.is_playing()):
			$Well.stop()


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayers.append($SE1)
	AudioPlayers.append($SE2)
	AudioPlayers.append($SE3)
	AudioPlayers.append($SE4)
	AudioPlayers.append($SE5)
	AudioPlayers.append($SE6)
	$Well.stream = well


func play_music():
	$Music.stream = bgm
	$Music.play()
	default_volume()
	
func play_title():
	$Music.stream = title
	$Music.play()
	default_volume()

func default_volume():
	$Music.volume_db = -8

func lower_volume():
	$Music.volume_db = -12
