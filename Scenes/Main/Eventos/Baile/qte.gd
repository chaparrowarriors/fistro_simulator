extends Control

# Variables para el QTE
var qte_button : Button
var qte_timer : Timer
var is_qte_active : bool = false

func _ready():
	# Configuración inicial
	qte_button = $QTE_Button
	qte_timer = Timer.new()
	add_child(qte_timer)
	qte_timer.wait_time = 3  # Tiempo de espera del QTE (ajusta según sea necesario)

func start_qte():
	# Inicia el QTE
	is_qte_active = true
	qte_timer.start()

func _on_QTE_Button_pressed():
	# Maneja el evento de botón presionado durante el QTE
	if is_qte_active:
		print("QTE successful!")
		end_qte()

func _on_QTE_Timer_timeout():
	# Maneja el tiempo de espera del QTE
	if is_qte_active:
		print("QTE failed!")
		end_qte()

func end_qte():
	# Finaliza el QTE
	is_qte_active = false
	qte_timer.stop()
