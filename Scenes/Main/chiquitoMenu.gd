extends CharacterBody2D

var speed = 300.0
const JUMP_VELOCITY = -200.0
var chisteOn = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var iconos = ["Bocadillo/Icono1", "Bocadillo/Icono2", "Bocadillo/Icono3", "Bocadillo/Icono4"]
var audioChistes = ["AudioChiste1", "AudioChiste2", "AudioChiste3", "AudioChiste4"]

func _ready():
	$AnimatedSprite2D.play('default')

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		emiteSonido(1)

	var direction = Input.get_axis("ui_left", "ui_right")
	changeDir(direction)
		
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
		
	if chisteOn || Global.chisteQTEon: 
		velocity.x = 0
		
	if (Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left")) and velocity.x != 0:
		emiteSonido(2)
	
	move_and_slide()
		

	
func changeDir(direction):
	if direction < 0:
		$AnimatedSprite2D.flip_h = 1
		$Bocadillo.flip_h = 1
		$Bocadillo.position.x = -60
	if direction > 0:
		$AnimatedSprite2D.flip_h = 0
		$Bocadillo.flip_h = 0
		$Bocadillo.position.x = 60
	
func emiteSonido(num):
	var rand = randi_range(1,15)	
	if chisteOn == false:
		match num:
			1:
				match rand:
					1: 
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/fistro.mp3")
						get_node("AudioMovimiento").play()
					2:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/fuegorrrlll.mp3")
						get_node("AudioMovimiento").play()
					3:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/grito.mp3")
						get_node("AudioMovimiento").play()
					4:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/Cobarde.mp3")
						get_node("AudioMovimiento").play()
					5:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/al_ataque.mp3")
						get_node("AudioMovimiento").play()
			2:
				match rand:
					1: 
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/caballos.mp3")
						get_node("AudioMovimiento").play()
						await get_tree().create_timer(2).timeout
					2:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/quietorrrrr.mp3")
						get_node("AudioMovimiento").play()
						await get_tree().create_timer(2).timeout
					3:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/te_da_cuen.mp3")
						get_node("AudioMovimiento").play()
						await get_tree().create_timer(2).timeout
					4:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/grito.mp3")
						get_node("AudioMovimiento").play()
						await get_tree().create_timer(2).timeout
					5:
						get_node("AudioMovimiento").stream = load("res://Assets/Sonidos/diodenar.mp3")
						get_node("AudioMovimiento").play()
						await get_tree().create_timer(2).timeout
