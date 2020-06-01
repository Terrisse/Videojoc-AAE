extends Area2D
var velocitat_bala=400
var moviment_bala=Vector2()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mou_bala(delta)
	
func mou_bala(delta):
	#hem de normalitzar la velocitat ja que en el cas que vagi en diagonal anirà més ràpid 
	moviment_bala.x+=5
	moviment_bala=moviment_bala.normalized()*velocitat_bala
	position+=moviment_bala * delta
	

func _on_Timer_eliminar_bala_timeout():
	queue_free()


func _on_bala_body_entered(body):
	#creo un grup comú per tots els enemics perquè en funció de la vida que tinguin a la variable body.vida, controlem les bales necessàries per matar a l'enemic. 
	#Fixant la variable vida a 1, 2 ,3 en funció del nivell, establim la dificultat per cada nivell. 
	print('bala')
	if body.is_in_group("enemics"):
		
		if body.vida>0:
			body.vida-=1
			#$body/vida_enemic.Text="3" No funciona
		if body.vida==0:
			body.queue_free() #aquí elimino la instància de l'enemic1
		queue_free() #aquí elimino la instància de la bala 
		


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.
