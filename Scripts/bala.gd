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
