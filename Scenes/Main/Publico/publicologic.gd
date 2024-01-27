extends Node2D

var animo = 100
var peticiones = [3, 0, 2, 1]
var peticiones_valor = [25, 25, 25, 25]
var peticiones_icon = ['res://Assets/Images/payaso.png', 'res://Assets/Images/calavera.png', 'res://Assets/Images/corchea.png', 'res://Assets/Images/berenjena.png']
var peticiones_randtime_wait = [7, 14]
var peticiones_randtime_next = [10, 20]
var descenso = 1
var peticion_actual
var tiempo = 0
var randtime_wait = 0
var randpeti
var change_opacidad = false

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2).timeout
	var randtime = randi_range(1, 5)
	#print(randtime)
	await get_tree().create_timer(randtime).timeout
	$Timer.start()
	peticion()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if change_opacidad:
		opacidad()


func animo_bar():
	animo -= descenso
	if animo >= 66:
		$expresion.texture = load("res://Assets/Images/publicoexpress1.png")
	elif animo < 66 and animo >= 33:
		$expresion.texture = load("res://Assets/Images/publicoexpress2.png")
	elif animo < 33:
		$expresion.texture = load("res://Assets/Images/publicoexpress3.png")

func _on_timer_timeout():
	animo_bar()
	tiempo += 1
	#print(animo, "-", tiempo)
	$Timer.start()

func peticion():
	randpeti = randi_range(0,3)
	peticion_actual = peticiones[randpeti]
	$peticionglobo/peticionicono.texture = load(peticiones_icon[randpeti])
	$peticionglobo.visible = true
	#print(randpeti)
	randtime_wait = randi_range(peticiones_randtime_wait[0], peticiones_randtime_wait[1])
	change_opacidad = true
	await get_tree().create_timer(randtime_wait).timeout
	change_opacidad = false
	$peticionglobo/peticionicono.modulate.a = 1
	peticion_actual = null
	$peticionglobo.visible = false
	peticion_next()
	
func peticion_next():
	var randtime_next = randi_range(peticiones_randtime_next[0], peticiones_randtime_wait[1])
	await get_tree().create_timer(randtime_next).timeout
	peticion()

func opacidad():
	$peticionglobo/peticionicono.modulate.a -= 0.0005
	
func recibir_chiste():
	print(Global.chiste_type)
	print(peticion_actual)
	print(Global.chiste_result)
	if Global.chiste_type == peticion_actual and Global.chiste_result == true:
		animo += peticiones_valor[randpeti]
		$peticionglobo/peticionicono/peticionresult.texture = load("res://Assets/Images/correct.png")
		$peticionglobo/peticionicono/peticionresult.visible = true
		await get_tree().create_timer(1).timeout
		$peticionglobo/peticionicono/peticionresult.visible = false
	if Global.chiste_type != peticion_actual and Global.chiste_result == false:
		animo -= peticiones_valor[randpeti]
		$peticionglobo/peticionicono/peticionresult.texture = load("res://Assets/Images/fallo.png")
		$peticionglobo/peticionicono/peticionresult.visible = true
		await get_tree().create_timer(1).timeout
		$peticionglobo/peticionicono/peticionresult.visible = false
	if Global.chiste_type != peticion_actual and Global.chiste_result == true:
		$peticionglobo/peticionicono/peticionresult.texture = load("res://Assets/Images/neutral.png")
		$peticionglobo/peticionicono/peticionresult.visible = true
		await get_tree().create_timer(1).timeout
		$peticionglobo/peticionicono/peticionresult.visible = false
	if Global.chiste_type == peticion_actual and Global.chiste_result == false:
		$peticionglobo/peticionicono/peticionresult.texture = load("res://Assets/Images/neutral.png")
		$peticionglobo/peticionicono/peticionresult.visible = true
		await get_tree().create_timer(1).timeout
		$peticionglobo/peticionicono/peticionresult.visible = false
