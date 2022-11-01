extends "res://Scripts/Gravity_Object.gd"
signal hit

var well_intensity = 70


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move_intensity = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	grav_intensity = 20
	max_speed = 1300


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func gravity_pull(pos):
	var hypotenuse = position.distance_to(pos)
	var xdist = position.x - pos.x
	var ydist = position.y - pos.y
	velocity.x -= well_intensity * (xdist / hypotenuse)
	velocity.y -= well_intensity * (ydist / hypotenuse)
	
	

func handle_input(delta):
	if Input.is_action_pressed("grav_left"):
		velocity.x += -move_intensity * delta
	if Input.is_action_pressed("grav_right"):
		velocity.x += move_intensity * delta
	if Input.is_action_pressed("grav_up"):
		velocity.y += -move_intensity * delta
	if Input.is_action_pressed("grav_down"):
		velocity.y += move_intensity * delta
		

func _process(delta):
	handle_input(delta)


func _on_Player_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var aname = area.get_name()
	if aname[0] == "A" or aname[1] == "A":
		get_parent().remove_child(area)
		get_parent().increment_health(-2)
		MusicController.play_SE("asteroid")
	elif aname[0] == "S" or aname[1] == "S":
		get_parent().increment_score(200)
		get_parent().increment_health(1)
		get_parent().remove_child(area)
		get_parent().spawn_star(position)
		get_parent().spawn_asteroid(position)
		MusicController.play_SE("star")

