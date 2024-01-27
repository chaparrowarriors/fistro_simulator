extends Node2D

var ran = RandomNumberGenerator.new()
var random_max = 4 # Variable aleatoria del máximo de opciones disponibles.
var secuen_max = 4 # Máximo de inputs necesarios para superar el Baile


var tiempo_max = 10 # Segundos máximos para realizar la secuencia.
var timer

var exito = false
var input # Valor del input esperado

#Textruas
var textura1 = load("res://Assets/Images/flecha_der.jpg")
var textura2 = load("res://Assets/Images/flecha_izq.jpg")
var textura3 = load("res://Assets/Images/flecha_up.jpg")
var textura4 = load("res://Assets/Images/flecha_down.jpg")

# Called when the node enters the scene tree for the first time.
func _ready():
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
	# Comprobamos si el input corresponde
	if event.is_action_pressed("ui_right") and input == 1:
		exito = true
		
	if event.is_action_pressed("ui_left") and input == 2:
		exito = true
		
	if event.is_action_pressed("ui_up")   and input == 3:
		exito = true
		
	if event.is_action_pressed("ui_down") and input == 4:
		exito = true
	
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
			print("Exito")
	else:
		print("Fracaso")
		
func fin_baile():
	pass
	
