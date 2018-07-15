extends Node2D

var FRAMECOUNT = 0

func _ready():
	set_process(true)
	

func _process(delta):
	FRAMECOUNT += 1
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
