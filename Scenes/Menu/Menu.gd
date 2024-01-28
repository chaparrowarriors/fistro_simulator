extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.zonaChiquito = $Chiquito.position.x / 1920
	if Global.zonaChiquito < 0.33:
		$Foco1.visible = true
		$Foco2.visible = false
		$Foco3.visible = false
	elif Global.zonaChiquito > 0.33 and Global.zonaChiquito < 0.66:
		$Foco2.visible = true
		$Foco1.visible = false
		$Foco3.visible = false
	elif Global.zonaChiquito > 0.66:
		$Foco3.visible = true
		$Foco1.visible = false
		$Foco2.visible = false

func _input(event):
	if Input.is_action_just_pressed("ui_up"):
		if Global.zonaChiquito < 0.33:
			pass
		elif Global.zonaChiquito > 0.33 and Global.zonaChiquito < 0.66:
			get_tree().change_scene_to_file("res://Scenes/Main/Stage.tscn")
		elif Global.zonaChiquito > 0.66:
			get_tree().quit()
