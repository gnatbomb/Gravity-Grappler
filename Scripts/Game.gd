extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var width = 1600
var height = 900


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	$Player.start($StartPosition.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
