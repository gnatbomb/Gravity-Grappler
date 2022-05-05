extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var width
var height
var wellradius = 256 / 5 / 2
var wells
var close_well
var close_distance
var rng = RandomNumberGenerator.new()
var starsize = 60
var star_scene = load("res://Prefabs/Star.tscn")
var asteroid_scene = load("res://Prefabs/Asteroid.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	width = get_viewport().size.x
	height = get_viewport().size.y
	rng.randomize()
	new_game()

func new_game():
	$Player.start($StartPosition.position)
	$Gravity_Well_1.start(Vector2(width / 4, height / 2))
	$Gravity_Well_2.start(Vector2(width * 3 / 4, height / 2))
	wells = [$Gravity_Well_1, $Gravity_Well_2]
	spawn_star($Player.position)
	
func handle_input():
	if Input.is_action_pressed("activate_grav"):
		$Player.gravity_pull(close_well.position)
	
func closest_well():
	close_well = wells[0]
	close_distance = close_well.position.distance_squared_to($Player.position)
	if close_distance > wells[1].position.distance_squared_to($Player.position):
		close_well = wells[1]
		close_distance = close_well.position.distance_squared_to($Player.position)
		

func spawn_star(pos):
	var randpos = Vector2(rng.randf_range(starsize, width - starsize),
		rng.randf_range(starsize, height - starsize))
	
	while pos.distance_to(randpos) <= 100:
		randpos = Vector2(rng.randf_range(starsize, width - starsize),
			rng.randf_range(starsize, height - starsize))
			
	var star = star_scene.instance() 
	star.position = randpos
	add_child(star)
	
func spawn_asteroid(pos):
	var randpos = Vector2(rng.randf_range(starsize, width - starsize),
	rng.randf_range(starsize, height - starsize))
	
	while pos.distance_to(randpos) <= 700:
		randpos = Vector2(rng.randf_range(starsize, width - starsize),
			rng.randf_range(starsize, height - starsize))
			
	var asteroid = asteroid_scene.instance() 
	asteroid.position = randpos
	var randvel = Vector2(rng.randf_range(0, 70),
		rng.randf_range(0, 70))
	asteroid.velocity = randvel
	add_child(asteroid)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	closest_well()
	handle_input()
