extends Node2D

signal contarChiste

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func _input(event):
	if Input.is_action_just_pressed("ChisteNegro"):
		$Chiquito.showChiste(1)
	if Input.is_action_just_pressed("ChisteVerde"):
		$Chiquito.showChiste(2)
	if Input.is_action_just_pressed("Coplilla"):
		$Chiquito.showChiste(3)
	if Input.is_action_just_pressed("ChisteAbsurdo"):
		$Chiquito.showChiste(4)
	
	Global.zonaChiquito = $Chiquito.position.x / 1920

func recibirChiste():
	if Global.zonaChiquito < 0.20:
		print("Entra1")
		$Publico1.recibir_chiste()
	elif Global.zonaChiquito < 0.40:
		print("Entra2")
		$Publico4.recibir_chiste()
	elif Global.zonaChiquito < 0.60:
		print("Entra3")
		$Publico2.recibir_chiste()
	elif Global.zonaChiquito < 0.80:
		print("Entra4")
		$Publico5.recibir_chiste()
	else:
		print("Entra5")
		$Publico3.recibir_chiste()
	
		
