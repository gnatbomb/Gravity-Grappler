extends "res://Scripts/Gravity_Object.gd"
signal hit

var well_intensity = 40


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	grav_intensity = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func gravity_pull(pos):
	if position.x < pos.x:
		velocity.x += well_intensity
	else:
		velocity.x -= well_intensity
		
	if position.y < pos.y:
		velocity.y += well_intensity
	else:
		velocity.y -= well_intensity


func _on_Player_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("outchie")
	pass # Replace with function body.
