extends Node2D

var obstacle = load("res://Scenes/enemics i obstacles/explosió 1.tscn")

func _process(delta):
	if $"temps de generació".is_stopped():
		crear_obstacle()
		$"temps de generació".start()
		
func crear_obstacle():
	var nou_obstacle = obstacle.instance()
	nou_obstacle.global_position = Vector2(1, 122)
	add_child(nou_obstacle)
