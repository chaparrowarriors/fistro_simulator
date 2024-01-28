extends Node2D

@export var animo = 100
var peticiones = [3, 0, 2, 1]
var peticiones_valor = [25, 25, 25, 25]
var peticiones_icon = ['res://Assets/Images/payaso.png', 'res://Assets/Images/calavera.png', 'res://Assets/Images/corchea.png', 'res://Assets/Images/berenjena.png']
var peticiones_randtime_wait = [7, 14]
var peticiones_randtime_next = [10, 20]
var descenso = 1
var peticion_actual
var tiempo = 0
var randtime_wait = 0
var randtime_next = 0
var randpeti = 0
var change_opacidad = false


func startPublico():
	var randtime = randi_range(2, 12)
	$timerStart.wait_time = randtime
	$timerStart.start()
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	#await get_tree().create_timer(2).timeout
	#var randtime = randi_range(1, 10)
	##print(randtime)
	#await get_tree().create_timer(randtime).timeout
	#$timerAnimo.start()
	#peticion()
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if change_opacidad:
		opacidad()
	pauseTimer(Global.pause)
	#print("wait: ", $timerPeticiones.time_left)
	#print("next: ", $timerNextPetcion.time_left)

func pauseTimer(pause):
	$timerPeticiones.paused = pause
	$timerAnimo.paused = pause
	$timerNextPetcion.paused = pause
	$timerStart.paused = pause
	
func animo_bar():
	animo -= descenso
	if animo >= 75:
		$expresion.play('happy')
	elif animo >= 50:
		$expresion.play('normal')
	elif animo >= 25:
		$expresion.play('sad')
	else:
		$expresion.play('angry')

func _on_timer_timeout():
	animo_bar()
	tiempo += 1
	#print(tiempo)
	$timerAnimo.start()

func peticion():
	#print("entra en peticion")
	randpeti = randi_range(0,3)
	peticion_actual = peticiones[randpeti]
	$peticionglobo/peticionicono.texture = load(peticiones_icon[randpeti])
	$peticionglobo.visible = true
	#print(randpeti)
	randtime_wait = randi_range(peticiones_randtime_wait[0], peticiones_randtime_wait[1])
	change_opacidad = true
	#print(randtime_wait)
	$timerPeticiones.wait_time = randtime_wait
	$timerPeticiones.start()
	#await get_tree().create_timer(randtime_wait).timeout
	
func peticion_next():
	#print("entra peticion next")
	randtime_next = randi_range(peticiones_randtime_next[0], peticiones_randtime_wait[1])
	#await get_tree().create_timer(randtime_next).timeout
	#print(randtime_next)
	$timerNextPetcion.wait_time = randtime_next
	$timerNextPetcion.start()
	print("Start next pet")

func opacidad():
	if not Global.pause:
		$peticionglobo/peticionicono.modulate.a -= 0.0005
	
func recibir_chiste():
	#print(Global.chiste_type)
	#print(peticion_actual)
	#print(Global.chiste_result)
	if Global.chiste_type == peticion_actual and Global.chiste_result == true:
		animo += peticiones_valor[randpeti]
		$peticionglobo/peticionresult.texture = load("res://Assets/Images/greentick.png")
	if Global.chiste_type != peticion_actual and Global.chiste_result == false:
		animo -= peticiones_valor[randpeti]
		$peticionglobo/peticionresult.texture = load("res://Assets/Images/redx.png")
		$peticionglobo/peticionresult.scale.x = 0.2
		$peticionglobo/peticionresult.scale.y = 0.2
	if Global.chiste_type != peticion_actual and Global.chiste_result == true:
		$peticionglobo/peticionresult.texture = load("res://Assets/Images/neutral.png")
	if Global.chiste_type == peticion_actual and Global.chiste_result == false:
		$peticionglobo/peticionresult.texture = load("res://Assets/Images/neutral.png")
	
	$peticionglobo/peticionresult.visible = true
	await get_tree().create_timer(1).timeout
	$peticionglobo/peticionresult.visible = false
	$peticionglobo.visible = false


func _on_timer_peticiones_timeout():
	#print("final timer wait")
	change_opacidad = false
	$peticionglobo.visible = false
	$peticionglobo/peticionicono.modulate.a = 1
	peticion_actual = null
	peticion_next()


func _on_timer_next_petcion_timeout():
	#print("final timer next")
	peticion()


func _on_timer_start_timeout():
	$timerAnimo.start()
	peticion()
