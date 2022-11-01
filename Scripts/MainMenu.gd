extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_title()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func new_game():
	MusicController.play_SE("star")
	get_tree().change_scene("res://Scenes/Game.tscn")
