extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var width
var height
var wellradius = 256 / 5 / 2


# Called when the node enters the scene tree for the first time.
func _ready():
	width = get_viewport().size.x
	height = get_viewport().size.y
	new_game()

func new_game():
	
	$Player.start($StartPosition.position)
	$Gravity_Well_1.start(Vector2(width / 4, height / 2))
	$Gravity_Well_2.start(Vector2(width * 3 / 4, height / 2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
