extends Node
export (PackedScene) var enemic1
var inici_nivell_1 =false




# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer_inici_joc.start()
	
	
	
func game_over_nivell_1():
	get_tree().change_scene("res://Scenes/menus/has perdut.tscn")
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_Timer_inici_joc_timeout():
	$Timer_nou_enemic.start()
	


func _on_Timer_nou_enemic_timeout():
	
	var E = enemic1.instance()
	E.position=$avio.position
	E.position.x+=1000
	add_child(E) # es crea un nou enemic
	print('creacioenemic')
	
	
func _on_avio_explosio_collision():
	print("ha colisionat")
	$avio/AnimatedSprite.hide()
	game_over_nivell_1()
	
	



func _on_avio_collisio_amb_enemic1():
	#game_over_nivell_1() coco
	pass 
