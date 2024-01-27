extends Sprite2D

var arrancar = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$"logo trans".modulate.a = 0
	await get_tree().create_timer(1).timeout
	$chaparro_sonido.play()
	arrancar = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"logo trans".modulate.a = $"logo trans".modulate.a + 0.005
	if !$chaparro_sonido.is_playing() && arrancar:
		get_tree().change_scene_to_file("res://menu/menu.tscn")
		
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_tree().change_scene_to_file("res://menu/menu.tscn")
