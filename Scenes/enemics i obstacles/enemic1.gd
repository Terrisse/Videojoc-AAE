extends KinematicBody2D
var velocitat=200
var moviment=Vector2()
var pantalla
var primera_pasada=false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pantalla=get_viewport_rect().size
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mou(delta)
	
func mou(delta):	
	
	if primera_pasada==false:
		moviment.y=50 #randi() % 200
	else:
		moviment.y=0
	moviment=Vector2.ZERO
	moviment.x=100
	position+=moviment * delta
	position.y=clamp(position.y,10,pantalla.y-40)
