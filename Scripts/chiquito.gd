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

	var direction = Input.get_axis("ui_left", "ui_right")
	changeDir(direction)
		
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
		
	if chisteOn || Global.chisteQTEon: 
		velocity.x = 0

	move_and_slide()

func showChiste(chiste):
	if chisteOn || Global.chisteQTEon:
		return
	chiste -= 1
	Global.chiste_type = chiste
	initChiste(chiste)
	await get_tree().create_timer(1).timeout
	endChiste(chiste)

func initChiste(chiste):
	chisteOn = true
	get_node(iconos[chiste]).visible = 1
	$Bocadillo.visible = 1
	$AnimatedSprite2D.play('habla')
	get_node(audioChistes[chiste]).play()

func endChiste(chiste):
	get_node(iconos[chiste]).visible = 0
	$Bocadillo.visible = 0
	$AnimatedSprite2D.play('default')
	chisteOn = false
	$QTE.initChisteQTE()

func changeDir(direction):
	if direction < 0:
		$AnimatedSprite2D.flip_h = 1
		$Bocadillo.flip_h = 1
		$Bocadillo.position.x = -60
	if direction > 0:
		$AnimatedSprite2D.flip_h = 0
		$Bocadillo.flip_h = 0
		$Bocadillo.position.x = 60
