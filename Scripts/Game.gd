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
var score = 0
var health = 5
var max_health = 5


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
	$ScoreLabel.rect_position = Vector2(width - 250, height - 50)
	$HealthLabel.rect_position = Vector2(20, height - 50)
	wells = [$Gravity_Well_1, $Gravity_Well_2]
	spawn_star($Player.position)
	
func handle_input():
	if Input.is_action_pressed("activate_grav"):
		closest_well()
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
	
	while pos.distance_to(randpos) <= 600:
		randpos = Vector2(rng.randf_range(starsize, width - starsize),
			rng.randf_range(starsize, height - starsize))
			
	var asteroid = asteroid_scene.instance() 
	asteroid.position = randpos
	var randvel = Vector2(rng.randf_range(10, 120),
		rng.randf_range(10, 120))
	asteroid.velocity = randvel
	add_child(asteroid)
	
func increment_health(amount):
	health += amount
	if health > max_health:
		health = max_health
	elif health < 1:
		game_over()
		
func increment_score(amount):
	score += amount
		
func game_over():
	print("Game Over")
	health = max_health
	
func update_gui():
	$ScoreLabel.text = "Score: " + str(score)
	$HealthLabel.text = "Health: " + str(health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_gui()
	handle_input()
