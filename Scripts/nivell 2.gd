extends Node

export (PackedScene) var enemic1
export (PackedScene) var explosio1
export (PackedScene) var explosio1b
export (PackedScene) var municion

var inici_nivell_1 =false


func _ready():
	$timer_inici_de_joc.start()
	randomize()

func game_over_nivell_1():
	get_tree().change_scene("res://Scenes/menus/has perdut.tscn")
	
	
	
func _on_timer_inici_de_joc_timeout():
	$Timer_nou_enemic.start()
	$Timer_municio.start()



func _on_timer_nou_enemic_timeout():
	var E = enemic1.instance()
	E.position.x=$avio.position.x + 1000
	E.position.y= rand_range(10, 142)
	add_child(E) #nou enemic

	

func _on_timer_nova_explosio_timeout():
	yield(get_tree().create_timer(1,rand_range(2,5)),"timeout")
	var explosio = explosio1.instance()
	explosio.position.x=$avio.position.x + rand_range(10,200)
	explosio.position.y= 142
	add_child(explosio) #nou foc de baix


func _on_timer_nova_explosio2_timeout():
	yield(get_tree().create_timer(1,rand_range(2,5)),"timeout")
	var explosio2 = explosio1b.instance()
	explosio2.position.x=$avio.position.x + rand_range(10,200)
	explosio2.position.y= 10
	add_child(explosio2) #nou foc de dalt




func _on_timer_municio_timeout():
	var m=municion.instance()
	m.position.x=$avio.position.x + 500
	m.position.y= rand_range(10,142)
	add_child(m)


func _on_avio_explosio_collision():
	$avio/AnimatedSprite.hide()
	game_over_nivell_1()


func _on_avio_collisio_amb_enemic1():
	game_over_nivell_1() 
	pass 

func _on_avio_collisio_amb_municion():
	var bales_actuals=int($avio/Comptador.text)
	bales_actuals+=3
	$avio/Comptador.text=str(bales_actuals)
