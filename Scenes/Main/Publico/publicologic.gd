extends Node2D

var animo = 100
var peticiones = ['payaso', 'negro', 'corcheas', 'berenjena']
var peticiones_valor = [25, 25, 25, 25]
var peticiones_randtime_wait = [7, 14]
var peticiones_randtime_next = [10, 20]
var descenso = 1
var peticion_actual
var tiempo = 0
var randpeti

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2).timeout
	var randtime = randi_range(1, 5)
	print(randtime)
	await get_tree().create_timer(randtime).timeout
	$Timer.start()
	peticion()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func animo_bar():
	animo -= descenso


func _on_timer_timeout():
	animo_bar()
	tiempo += 1
	print(animo, "-", tiempo)
	$Timer.start()

func peticion():
	randpeti = randi_range(0,3)
	peticion_actual = peticiones[randpeti]
	var randtime_wait = randi_range(peticiones_randtime_wait[0], peticiones_randtime_wait[1])
	await get_tree().create_timer(randtime_wait).timeout
	peticion_actual = null
	peticion_next()
	
func peticion_next():
	var randtime_next = randi_range(peticiones_randtime_next[0], peticiones_randtime_wait[1])
	await get_tree().create_timer(randtime_next).timeout
	peticion()
	
func recibir_chiste():
	if Global.chiste_type == peticion_actual and Global.chiste_result == true:
		animo += peticiones_valor[randpeti]
	if Global.chiste_type != peticion_actual and Global.chiste_result == false:
		animo -= peticiones_valor[randpeti]
	if Global.chiste_type != peticion_actual and Global.chiste_result == true:
		pass
	if Global.chiste_type == peticion_actual and Global.chiste_result == false:
		pass
