extends Area2D
var velocitat=200
var moviment=Vector2()
# per què no es pugui sortir de la pantalla:
var pantalla
onready var Posicio_avio=$Posicio_avio
onready var Timer_temps_bala=$Timer_temps_bala
var bala= load("res://Scenes/bala.tscn")
var direccio_bala=Vector2()
var fi_joc=false
signal explosio_collision
signal collisio_amb_enemic1
signal collisio_amb_municion






func _ready():
	#hide() #amago a fatboy perquè surti el menú inicial
	pantalla=get_viewport_rect().size
	fi_joc=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mou(delta)
	
	
	
func disparar(bala) -> void:
	if !self.Timer_temps_bala.is_stopped() or int($Comptador.text)==0:
		return 
	if int($Comptador.text)>0:
		var num_bales=int($Comptador.text)-1
		$Comptador.text=str(num_bales)
	
	var nova_bala=bala.instance()
	self.get_parent().add_child(nova_bala)
	nova_bala.global_position=self.Posicio_avio.global_position
	self.Timer_temps_bala.start()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func mou(delta):
	if position.x>=19900:
		get_tree().change_scene("res://Scenes/hasguanyat.tscn")
	
	if Input.is_action_pressed("disparar"):
		disparar(bala)
		
	if Input.is_action_pressed("adalt"):
		moviment.y=-200
	elif Input.is_action_pressed("abaix"):
		moviment.y=200
	else:
		moviment=Vector2.ZERO
	if fi_joc==false:
		moviment.x=100
	else:
		moviment.x=0
	
	#hem de normalitzar la velocitat ja que en el cas que vagi en diagonal anirà més ràpid 
	#if moviment.length()>0: #en aquest cas s'estarà movent
		#moviment=moviment.normalized()*velocitat
	position+=moviment * delta
	position.y=clamp(position.y,10,pantalla.y-40)



func _on_avio_body_entered(body):
	if body.is_in_group("explosio"):
		emit_signal("explosio_collision")
	
	if body.is_in_group("municion"):
		emit_signal("collisio_amb_municion")
		body.queue_free()
	
	
		


func _on_avio_area_entered(area):
	if area.is_in_group("enemic1"):
		emit_signal("collisio_amb_enemic1")
