extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	print(event)
	if Input.is_action_just_pressed("ChisteNegro"):
		print("Chiste Negro")
		$Chiquito.showChiste(1)
	if Input.is_action_just_pressed("Coplilla"):
		$Chiquito.showChiste(2)
	if Input.is_action_just_pressed("ChisteVerde"):
		$Chiquito.showChiste(3)
	if Input.is_action_just_pressed("ChisteAbsurdo"):
		$Chiquito.showChiste(4)
		
