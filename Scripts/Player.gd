extends "res://Scripts/Gravity_Object.gd"
signal hit

var well_intensity = 70


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	grav_intensity = 30
	max_speed = 1100


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func gravity_pull(pos):
	var hypotenuse = position.distance_to(pos)
	var xdist = position.x - pos.x
	var ydist = position.y - pos.y
	velocity.x -= well_intensity * (xdist / hypotenuse)
	velocity.y -= well_intensity * (ydist / hypotenuse)
	
	



func _on_Player_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var aname = area.get_name()
	if aname[0] == "A":
		print("A")
	elif aname[0] == "G":
		print("G")
	elif aname[0] == "S":
		get_parent().remove_child(area)
		get_parent().spawn_star(position)
		get_parent().spawn_asteroid(position)
