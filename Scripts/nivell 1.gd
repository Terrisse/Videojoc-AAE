extends Node
export (PackedScene) var enemic1
export (PackedScene) var explosio1
export (PackedScene) var explosio1b
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



func _on_Timer_nova_explosio_timeout():
	var ex = explosio1.instance()
	ex.position.x=$avio.position.x + 1000
	ex.position.y= 142
	
	
	#E.position.x+=1000
	add_child(ex) # es crea un nou enemic

	
	
	#var EX2 = explosio1b.instance()
	#var n = rand_range(1,3)
	#if n == 1:
		#EX.position.x = $avio.position.x + 1000
		#EX.position.y = 10
		#add_child(EX) 
		
	#else:
		#EX2.position.x = $avio.position.x + 1000
		#EX2.position.y = 142
		#add_child(EX2) 

