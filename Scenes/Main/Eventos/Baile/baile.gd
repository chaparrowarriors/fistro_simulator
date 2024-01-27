extends Node2D

var secuen_max = 10  # Máximo de inputs necesarios para superar el Baile
var tiempo_max = 10.0 # Segundos máximos para realizar la secuencia.

# Constantes de posición de pantalla x min/max y y min/max
var viewport_tam
var x_max
var y_max
var x_min = 80
var y_min = 80
var pos_x
var pos_y
	
func _ready():
	$Timer.wait_time = tiempo_max
	$Timer.start()
	
	viewport_tam = get_viewport_rect().size
	x_max = viewport_tam.x - 80
	y_max = viewport_tam.y - 80 
	
	generar_pulsador(1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	pass

func generar_pulsador(num):
	
	pos_x = randf_range( x_min, x_max)
	pos_y = randf_range( y_min, y_max)
	
	match num:
		1:
			$qte1.set_position(Vector2(pos_x, pos_y))
			$qte1.visible = true
		2:
			$qte2.set_position(Vector2(pos_x, pos_y))
			$qte2.visible = true
		3:
			$qte3.set_position(Vector2(pos_x, pos_y))
			$qte3.visible = true
		4:
			$qte4.set_position(Vector2(pos_x, pos_y))
			$qte4.visible = true
		5:
			$qte5.set_position(Vector2(pos_x, pos_y))
			$qte5.visible = true
		6:
			$qte6.set_position(Vector2(pos_x, pos_y))
			$qte6.visible = true
		7:
			$qte7.set_position(Vector2(pos_x, pos_y))
			$qte7.visible = true
		8:
			$qte8.set_position(Vector2(pos_x, pos_y))
			$qte8.visible = true
		9:
			$qte9.set_position(Vector2(pos_x, pos_y))
			$qte9.visible = true
		10:
			$qte10.set_position(Vector2(pos_x, pos_y))
			$qte10.visible = true
			
func _on_qte_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte1.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(2)
			
func _on_qte_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte2.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(3)

func _on_qte_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte3.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(4)


func _on_qte_4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte4.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(5)


func _on_qte_5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte5.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(6)


func _on_qte_6_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte6.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(7)


func _on_qte_7_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte7.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(8)


func _on_qte_8_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte8.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(9)


func _on_qte_9_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte9.visible = false
			secuen_max = secuen_max - 1
			generar_pulsador(10)


func _on_qte_10_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
			$qte10.visible = false
			fin_baile(true)
			
func fin_baile(qte_result):
	Global.baile_result = qte_result
	
	if qte_result == true:
		print("EXITO")
	else:
		print("FALLO")
		
	get_tree().change_scene_to_file("res://Scenes/Main/Stage.tscn")

func _on_timer_timeout():
	print("TIMEOUT")
	Global.baile_result = false
	get_tree().change_scene_to_file("res://Scenes/Main/Stage.tscn")
