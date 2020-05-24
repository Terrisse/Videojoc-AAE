extends Area2D
var velocitat=200
var moviment=Vector2()
# per què no es pugui sortir de la pantalla:
var pantalla
onready var Posicio_avio=$Posicio_avio
onready var Posicio_terra=$Posicio_terra
onready var Timer_temps_bala=$Timer_temps_bala
var bala= load("res://Scenes/bala.tscn")
var direccio_bala=Vector2()
signal explosio_collision
signal terra_collision
signal collisio_amb_enemic1
var fi_joc=false








func _ready():
	#hide() #amago a fatboy perquè surti el menú inicial
	pantalla=get_viewport_rect().size
	fi_joc=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mou(delta)
	anima()
func disparar(bala) -> void:
	if !self.Timer_temps_bala.is_stopped():
		return 
	var nova_bala=bala.instance()
	self.get_parent().add_child(nova_bala)
	nova_bala.global_position=self.Posicio_avio.global_position
	self.Timer_temps_bala.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func mou(delta):
	
	if Input.is_action_pressed("disparar"):
		disparar(bala)
		
	if Input.is_action_pressed("adalt"):
		moviment.y=-200
	elif Input.is_action_pressed("abaix"):
		moviment.y=200
	else:
		moviment=Vector2.ZERO
	if fi_joc==false:
		moviment.x= 200
	else:
		moviment.x=0
	
	#hem de normalitzar la velocitat ja que en el cas que vagi en diagonal anirà més ràpid 
	#if moviment.length()>0: #en aquest cas s'estarà movent
		#moviment=moviment.normalized()*velocitat
	position+=moviment * delta
	position.y=clamp(position.y,10,pantalla.y-40)
	

func anima():
	pass


func _on_avio_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group("explosio"):
		emit_signal("explosio_collision")
		fi_joc=true
		pass
	if body.is_in_group("enemic1"):
		emit_signal("collisio_amb_enemic1")
	
	

	



	
	


func _on_avio_terra_collision():
	pass # Replace with function body.
