extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_speed = 900
var acceleration = 200
var current_grav = Vector2.ZERO
var grav_intensity = 25
var velocity = Vector2.ZERO

var width = 1600
var height = 900
var radius = 32
var bounce = -0.85
var slow = 0.99

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func check_velocity():
	if velocity.x > max_speed:
		velocity.x = max_speed
	if velocity.x < -max_speed:
		velocity.x = -max_speed
		
	if velocity.y > max_speed:
		velocity.y = max_speed
	if velocity.y < -max_speed:
		velocity.y = -max_speed
		
func update_position(delta):
	position += velocity * delta
	
	if position.x <= radius:
		position.x = radius
		velocity.x *= bounce
		velocity.y *= slow
	if position.x >= width - radius:
		position.x = width - radius
		velocity.x *= bounce
		velocity.y *= slow
		
	if position.y <= radius:
		position.y = radius
		velocity.y *= bounce
		velocity.x *= slow
	if position.y >= height - radius:
		position.y = height - radius
		velocity.y *= bounce
		velocity.x *= slow


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_velocity()
	update_position(delta)
	
	

