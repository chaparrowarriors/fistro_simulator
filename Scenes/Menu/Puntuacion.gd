extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Global.puntuacionFinal)
	if Global.puntuacionFinal < 100:
		$uno.visible = true
	elif Global.puntuacionFinal < 200:
		$dos.visible = true
	elif Global.puntuacionFinal < 300:
		$tres.visible = true
	elif Global.puntuacionFinal < 400:
		$cuatro.visible = true
	elif Global.puntuacionFinal < 500:
		$cinco.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Main/Stage.tscn")
	pass # Replace with function body.
