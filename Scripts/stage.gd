extends Node2D

signal contarChiste

var tiempo_foco = 30.0
var baileOn = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$TimerFoco.wait_time = tiempo_foco
	$TimerFoco.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func checkBaile():
	if baileOn:
		return
		
	if Global.zonaChiquito < 0.33 and $Foco1.visible == true:
		actuarBaile()
	elif Global.zonaChiquito > 0.33 and Global.zonaChiquito < 0.66 and $Foco2.visible == true:
		actuarBaile()
	elif Global.zonaChiquito > 0.66 and $Foco3.visible == true:
		actuarBaile()

func _input(event):
	if Input.is_action_just_pressed("ChisteNegro"):
		$Chiquito.showChiste(1)
	if Input.is_action_just_pressed("ChisteVerde"):
		$Chiquito.showChiste(2)
	if Input.is_action_just_pressed("Coplilla"):
		$Chiquito.showChiste(3)
	if Input.is_action_just_pressed("ChisteAbsurdo"):
		$Chiquito.showChiste(4)
	
	if Input.is_action_just_pressed("Jump"):
		checkBaile()
	
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
	
func actuarFoco():
	var foco = randi_range(1,3)
	match foco:
		1:
			$Foco1.visible = true
		2:
			$Foco2.visible = true
		3:
			$Foco3.visible = true

func actuarBaile():		
	$Oscuridad.modulate.a = 0.75
	baileOn = true
	
	var path = "res://Scenes/Main/Eventos/Baile/baile.tscn"
	var escenaBaile = load(path)
	var instanciaBaile = escenaBaile.instantiate()
	add_child(instanciaBaile)

func _on_timer_foco_timeout():
	actuarFoco()
