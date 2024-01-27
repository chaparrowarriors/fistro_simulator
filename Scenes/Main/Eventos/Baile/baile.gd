extends Node2D

var ran = RandomNumberGenerator.new()
var random_max = 4 # Variable aleatoria del máximo de opciones disponibles.
var secuen_max = 4 # Máximo de inputs necesarios para superar el Baile
var tiempo_max = 5.0 # Segundos máximos para realizar la secuencia.

var input # Valor del input esperado

#Textruas
var textura1 = load("res://Assets/Images/flecha_der.jpg")
var textura2 = load("res://Assets/Images/flecha_izq.jpg")
var textura3 = load("res://Assets/Images/flecha_up.jpg")
var textura4 = load("res://Assets/Images/flecha_down.jpg")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = tiempo_max
	$Timer.start()
	
	input = ran.randi_range(1, random_max)
	match input:
		1:
			$qte_icon.texture = textura1
		2:
			$qte_icon.texture = textura2
		3:
			$qte_icon.texture = textura3
		4:
			$qte_icon.texture = textura4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	pass
	
	
func _input(event):
	var exito = false
	
	# Comprobamos si el input corresponde
	if event.is_action_pressed("ui_right"):
		if input == 1:
			exito = true
		else:
			exito = false
	elif event.is_action_pressed("ui_left"):
		if input == 2:
			exito = true
		else:
			exito = false	
	elif event.is_action_pressed("ui_up"):
		if input == 3:
			exito = true
		else:
			exito = false	
	elif event.is_action_pressed("ui_down"):
		if input == 4:
			exito = true
		else:
			exito = false
	else:
		return
	
	# Cargamos el siguiente input si la secuencia aún no hubiera terminado.	
	if exito == true:	
		input = ran.randi_range(1, random_max)
		secuen_max = secuen_max - 1
		
		$qte_icon.texture = null
		await get_tree().create_timer(0.1).timeout
		if secuen_max > 0:
			match input:
				1:
					$qte_icon.texture = textura1
				2:
					$qte_icon.texture = textura2
				3:
					$qte_icon.texture = textura3
				4:
					$qte_icon.texture = textura4
		else:
			fin_baile(exito)
	else:
		fin_baile(exito)
		
func fin_baile(qte_result):
	Global.baile_result = qte_result
	
	if qte_result == true:
		print("EXITO")
	else:
		print("FALLO")
		
	get_tree().change_scene_to_file("res://Scenes/stage.tscn")
	

func _on_timer_timeout():
	print("TIMEOUT")
	Global.baile_result = false
	get_tree().change_scene_to_file("res://Scenes/stage.tscn")
