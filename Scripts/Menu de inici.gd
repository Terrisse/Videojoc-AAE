extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button_pressed():
	Global.nivell_joc=2
	get_tree().change_scene("res://Scenes/nivells/nivell 1.tscn")
	


func _on_Button2_pressed():
	get_tree().quit()


func _on_dificil_pressed():
	Global.nivell_joc=3
	get_tree().change_scene("res://Scenes/nivells/nivell 1.tscn")
	
	


func _on_facil_pressed():
	Global.nivell_joc=1
	get_tree().change_scene("res://Scenes/nivells/nivell 1.tscn")
	
