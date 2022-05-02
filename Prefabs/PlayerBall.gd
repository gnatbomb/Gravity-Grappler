extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_speed = 400
var acceleration = 200
var current_grav = Vector2.ZERO
var grav_intensity = 40
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func handle_input():
	if Input.is_action_pressed("grav_left"):
		current_grav.x = -grav_intensity
		current_grav.y = 0
	if Input.is_action_pressed("grav_right"):
		current_grav.x = grav_intensity
		current_grav.y = 0
	if Input.is_action_pressed("grav_up"):
		current_grav.x = 0
		current_grav.y = -grav_intensity
	if Input.is_action_pressed("grav_down"):
		current_grav.x = 0
		current_grav.y = grav_intensity
		

func handle_gravity():
	velocity.x += current_grav.x
	velocity.y += current_grav.y
	if velocity.x > max_speed:
		velocity.x = max_speed
	if velocity.y > max_speed:
		velocity.y = max_speed
	if velocity.x < -max_speed:
		velocity.x = -max_speed
	if velocity.y < -max_speed:
		velocity.y = -max_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()
	handle_gravity()
	
	position += velocity * delta
	
	

