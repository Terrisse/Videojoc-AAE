#extends KinematicBody2D
extends Area2D
var velocitat=200
var moviment=Vector2()
var pantalla
export var vida=2 




# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pantalla=get_viewport_rect().size
	vida=Global.nivell_joc
	$vida_enemic.text=str(vida)
	

	




# Called every frame. 'delta' is the elapsed time since the previous frame..
func _process(delta):
	mou(delta)
	
func mou(delta):	
	
	moviment=Vector2.ZERO
	moviment.x=40
	position-=moviment * delta
	position.y=clamp(position.y,10,pantalla.y-40)






func _on_enemic1_area_entered(area):
	#creo un grup comú per tots els enemics perquè en funció de la vida que tinguin a la variable body.vida, controlem les bales necessàries per matar a l'enemic. 
	#Fixant la variable vida a 1, 2 ,3 en funció del nivell, establim la dificultat per cada nivell. 
	
	if area.is_in_group("bala"):
	
		if vida>0:
			vida-=1
			$vida_enemic.text=str(vida)
			
		if vida==0:
			queue_free() #aquí elimino la instància de l'enemic1
		
