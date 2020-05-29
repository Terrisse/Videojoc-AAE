extends Node
export (PackedScene) var enemic1
export (PackedScene) var explosio1
export (PackedScene) var explosio1b
export (PackedScene) var municion

var inici_nivell_1 =false




# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer_inici_joc.start()
	randomize()
	
	
	
func game_over_nivell_1():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/menus/has perdut.tscn")
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_Timer_inici_joc_timeout():
	$Timer_nou_enemic.start()
	$Timer_municio.start()
	


func _on_Timer_nou_enemic_timeout():
	
	var E = enemic1.instance()
	E.position.x=$avio.position.x + 1000
	E.position.y= rand_range(10, 142)
	
	
	#E.position.x+=1000
	add_child(E) # es crea un nou enemic

	
	
func _on_avio_explosio_collision():
	print("ha colisionat")
	$avio/AnimatedSprite.hide()
	game_over_nivell_1()
	
	



func _on_avio_collisio_amb_enemic1():
	game_over_nivell_1() 
	pass 



func _on_Timer_nova_explosio_down_timeout():
	yield(get_tree().create_timer(1,rand_range(2,5)),"timeout") #aquesta funció genera un temps d'espera entre 1 i 5 abans de seguir amb la funció. 
	var ex_down = explosio1.instance()
	ex_down.position.x=$avio.position.x + rand_range(10,200)
	ex_down.position.y= 142

	add_child(ex_down) # es crea un nou foc


func _on_Timer_nova_explosio_up_timeout():
	yield(get_tree().create_timer(1,rand_range(2,5)),"timeout")
	var ex_up = explosio1b.instance()
	ex_up.position.x=$avio.position.x + rand_range(10,200)
	ex_up.position.y= 10

	add_child(ex_up) # es crea un nou foc

	


func _on_Timer_municio_timeout():
	print("asdfh")
	var m=municion.instance()
	m.position.x=$avio.position.x + 500
	m.position.y= rand_range(10,142)
	add_child(m)


func _on_avio_collisio_amb_municion():
	var bales_actuals=int($avio/Comptador.text)
	bales_actuals+=3 #cada cop que s'agafi la municio s'incrementaran les bales, es pot posar límit.
	$avio/Comptador.text=str(bales_actuals)
	
	
