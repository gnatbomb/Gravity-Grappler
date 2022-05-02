extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var w = 1700
var h = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(spot):
	if spot == 'left':
		position.x = -w / 2
		position.y = h / 2
	elif spot == 'right':
		position.x = w + w / 2
		position.y = h / 2
	elif spot == 'top':
		position.x = w / 2
		position.y = -h / 2
	else:
		position.x = -w / 2
		position.y = h + h / 2
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
