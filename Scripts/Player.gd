extends "res://Scripts/Gravity_Object.gd"
signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	grav_intensity = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Player_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("outchie")
	pass # Replace with function body.