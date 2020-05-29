extends MarginContainer
var moviment=Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mou(delta)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func mou(delta):
	moviment.x=100
	rect_position+=moviment * delta

	
	
	
	
