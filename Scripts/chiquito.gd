extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -200.0
var chisteOn = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var iconos = ["Bocadillo/Icono1", "Bocadillo/Icono2", "Bocadillo/Icono3", "Bocadillo/Icono4"]

func _ready():
	$AnimatedSprite2D.play('default')

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	changeDir(direction)
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func showChiste(chiste):
	if chisteOn:
		return
	
	chisteOn = true
	
	chiste -= 1
	get_node(iconos[chiste]).visible = 1
	$Bocadillo.visible = 1
	await get_tree().create_timer(3).timeout
	$Bocadillo.visible = 0
	get_node(iconos[chiste]).visible = 0
	
	chisteOn = false


func changeDir(direction):
	if direction < 0:
		$AnimatedSprite2D.flip_h = 1
		$Bocadillo.flip_h = 1
		$Bocadillo.position.x = -60
	if direction > 0:
		$AnimatedSprite2D.flip_h = 0
		$Bocadillo.flip_h = 0
		$Bocadillo.position.x = 60
