extends Node2D

var secuen_max = 10  # Máximo de inputs necesarios para superar el Baile
var tiempo_max = 20.0 # Segundos máximos para realizar la secuencia.
var secuen_act = 1   # Secuencia actual esperada 
var opacidad = 0.01 # Factor de cambio de opacidad

# Constantes de posición de pantalla x min/max y y min/max
var viewport_tam
var x_max
var y_max
var x_min = 80
var y_min = 80
var pos_x
var pos_y

# Check de completitud
var qte2_com = false
var qte3_com = false
var qte4_com = false
var qte5_com = false
var qte6_com = false
var qte7_com = false
var qte8_com = false
var qte9_com = false

func _ready():
	$Timer.wait_time = tiempo_max
	$Timer.start()
	
	viewport_tam = get_viewport_rect().size
	x_max = viewport_tam.x - 80
	y_max = viewport_tam.y - 80 
	inicializar_posicicones()
	
	$qte2.modulate.a = 0
	$qte3.modulate.a = 0
	$qte4.modulate.a = 0
	$qte5.modulate.a = 0
	$qte6.modulate.a = 0
	$qte7.modulate.a = 0
	$qte8.modulate.a = 0
	$qte9.modulate.a = 0
	$qte10.modulate.a = 0
	
	$qte1.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cambiar_opacidad()
	if secuen_act > secuen_max:
		fin_baile(true)

func inicializar_posicicones():
	$qte1.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte2.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte3.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte4.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte5.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte6.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte7.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte8.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte9.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))
	$qte10.set_position(Vector2(randf_range( x_min, x_max), randf_range( y_min, y_max)))

func cambiar_opacidad():
	
	if $qte3.visible == false and $qte2.modulate.a < 1 and qte2_com == false:
		$qte2.modulate.a = $qte2.modulate.a + opacidad
		$qte2.visible = true
	
	if $qte4.visible == false and $qte3.modulate.a < 1 and ($qte2.modulate.a > 1 or qte2_com == true):
		$qte3.modulate.a = $qte3.modulate.a + opacidad
		if qte2_com == false:
			$qte3.visible = true
		
	if $qte5.visible == false and $qte4.modulate.a < 1 and ($qte3.modulate.a > 1 or qte3_com == true):
		$qte4.modulate.a = $qte4.modulate.a + opacidad
		if qte3_com == false:
			$qte4.visible = true
				
	if $qte6.visible == false and $qte5.modulate.a < 1 and ($qte4.modulate.a > 1 or qte4_com == true):
		$qte5.modulate.a = $qte5.modulate.a + opacidad
		if qte4_com == false:
			$qte5.visible = true
					
	if $qte7.visible == false and $qte6.modulate.a < 1 and ($qte5.modulate.a > 1 or qte5_com == true):
		$qte6.modulate.a = $qte6.modulate.a + opacidad
		if qte5_com == false:
			$qte6.visible = true
				
	if $qte8.visible == false and $qte7.modulate.a < 1 and ($qte6.modulate.a > 1 or qte6_com == true):
		$qte7.modulate.a = $qte7.modulate.a + opacidad
		if qte6_com == false:
			$qte7.visible = true
				
	if $qte9.visible == false and $qte8.modulate.a < 1 and ($qte7.modulate.a > 1 or qte7_com == true):
		$qte8.modulate.a = $qte8.modulate.a + opacidad
		if qte7_com == false:
			$qte8.visible = true
				
	if $qte10.visible == false and $qte9.modulate.a < 1 and ($qte8.modulate.a > 1 or qte8_com == true):
		$qte9.modulate.a = $qte9.modulate.a + opacidad
		if qte8_com == false:
			$qte9.visible = true
				
	if $qte10.modulate.a < 1 and ($qte9.modulate.a > 1 or qte9_com == true):
		$qte10.modulate.a = $qte10.modulate.a + opacidad
		if qte9_com == false:
			$qte10.visible = true
		
func _on_qte_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 1: 
			$qte1.visible = false
			$qte2.visible = true
			secuen_act = secuen_act + 1
			
func _on_qte_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 2: 
			qte2_com = true
			$qte2.visible = false
			$qte3.visible = true
			secuen_act = secuen_act + 1

func _on_qte_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 3: 
			qte3_com = true
			$qte3.visible = false
			$qte4.visible = true
			secuen_act = secuen_act + 1


func _on_qte_4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 4: 
			qte4_com = true
			$qte4.visible = false
			$qte5.visible = true
			secuen_act = secuen_act + 1


func _on_qte_5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 5: 
			qte5_com = true
			$qte5.visible = false
			$qte6.visible = true
			secuen_act = secuen_act + 1

func _on_qte_6_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 6: 
			qte6_com = true
			$qte6.visible = false
			$qte7.visible = true
			secuen_act = secuen_act + 1

func _on_qte_7_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 7: 
			qte7_com = true
			$qte7.visible = false
			$qte8.visible = true
			secuen_act = secuen_act + 1

func _on_qte_8_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 8: 
			qte8_com = true
			$qte8.visible = false
			$qte9.visible = true
			secuen_act = secuen_act + 1

func _on_qte_9_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 9: 
			qte9_com = true
			$qte9.visible = false
			$qte10.visible = true
			secuen_act = secuen_act + 1

func _on_qte_10_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and secuen_act == 10: 
			$qte10.visible = false
			secuen_act = secuen_act + 1
			
func fin_baile(qte_result):
	$Timer.stop()
	Global.baile_result = qte_result
	get_node("/root/Stage/Oscuridad").modulate.a = 0
	get_node("/root/Stage/TimerFoco").stop()
	get_node("/root/Stage/TimerFoco").start()
	#if qte_result == true:
		#print("EXITO")
	#else:
		#print("FALLO")
		
	#get_tree().change_scene_to_file("res://Scenes/Main/Stage.tscn")

func _on_timer_timeout():
	#print("TIMEOUT")
	fin_baile(false)
	#get_tree().change_scene_to_file("res://Scenes/Main/Stage.tscn")
