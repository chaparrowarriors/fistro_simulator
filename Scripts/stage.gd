extends Node2D

signal contarChiste

var tiempo_foco = 20.0
var tiempo_vida_foco = 4.0
var baileOn = false
var reloj = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$TimerFoco.wait_time = tiempo_foco
	$TimerFoco.start()
	$TimerFinFoco.wait_time = tiempo_vida_foco
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Global.pause:
		reloj += delta
	var secs = int(floor(reloj))
	var mins = int(floor(reloj))/60
	secs = secs % 60
	if secs < 10:
		secs = str("0", secs)
	if mins < 10:
		mins = str("0", mins)
	$Reloj/Hora.text = str(mins, ":",secs)
	if int(mins) >= 1:
		puntuacion()
	checkAnimo()
	pauseTimer(Global.pause)
	pass
	
func pauseTimer(pause):
	$TimerFinFoco.paused = pause
	$TimerFoco.paused = pause

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
		
	if Input.is_action_just_pressed("Pause"):
		pausa()
	
	Global.zonaChiquito = $Chiquito.position.x / 1920

func recibirChiste():
	if Global.zonaChiquito < 0.20:
		print("Entra1")
		print($Publico1.get("animo"))
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
			
	$TimerFinFoco.start()

func actuarBaile():
	$TimerFinFoco.stop()
	$Oscuridad.modulate.a = 0.75
	baileOn = true
	
	$Chiquito.initBaile()
	
	var path = "res://Scenes/Main/Eventos/Baile/baile.tscn"
	var escenaBaile = load(path)
	var instanciaBaile = escenaBaile.instantiate()
	add_child(instanciaBaile)

func _on_timer_foco_timeout():
	actuarFoco()


func _on_timer_fin_foco_timeout():
	$Foco1.visible = false
	$Foco2.visible = false
	$Foco3.visible = false

func checkAnimo():
	if $Publico1.get("animo") <= 0:
		puntuacion()
	if $Publico2.get("animo") <= 0:
		puntuacion()
	if $Publico3.get("animo") <= 0:
		puntuacion()
	if $Publico4.get("animo") <= 0:
		puntuacion()
	if $Publico5.get("animo") <= 0:
		puntuacion()

func puntuacion():
	Global.puntuacionFinal = $Publico1.get("animo") + $Publico2.get("animo") + $Publico3.get("animo") + $Publico4.get("animo") + $Publico5.get("animo")
	print($Publico1.get("animo"), " - ", $Publico2.get("animo"), " - ", $Publico3.get("animo"), " - ", $Publico4.get("animo"), " - ", $Publico5.get("animo"))
	print(Global.puntuacionFinal)
	get_tree().change_scene_to_file("res://Scenes/Menu/Puntuacion.tscn")

func pausa():
	print(Global.pause)
	Global.pause = !Global.pause
	print(Global.pause)
