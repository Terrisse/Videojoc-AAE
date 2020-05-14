extends Area2D
var velocitat=200
var moviment=Vector2()
# per què no es pugui sortir de la pantalla:
var pantalla


func _ready():
	#hide() #amago a fatboy perquè surti el menú inicial
	pantalla=get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mou(delta)
	anima()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func mou(delta):
	if Input.is_action_pressed("adalt"):
		moviment.y=-200
	elif Input.is_action_pressed("abaix"):
		moviment.y=200
	else:
		moviment=Vector2.ZERO
	moviment.x= 200
	
	
	#hem de normalitzar la velocitat ja que en el cas que vagi en diagonal anirà més ràpid 
	#if moviment.length()>0: #en aquest cas s'estarà movent
		#moviment=moviment.normalized()*velocitat
	position+=moviment * delta
	#position.y=clamp(position.y,10,pantalla.y-100)
	
func anima():
	pass
