extends KinematicBody2D
var velocitat=200
var moviment=Vector2()
var pantalla



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pantalla=get_viewport_rect().size
	



# Called every frame. 'delta' is the elapsed time since the previous frame..
func _process(delta):
	mou(delta)
	
func mou(delta):	
	
	moviment=Vector2.ZERO
	moviment.x=40
	position-=moviment * delta
	position.y=clamp(position.y,10,pantalla.y-40)
