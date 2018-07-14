extends Node2D

var target

func _ready():
	target = null
	pass

func _process(delta):
	if (target != null):
		target_pos = target.position
		look_at(target.position)


func _on_Radar_body_entered(body):
	target = body
	pass # replace with function body


func _on_Radar_body_exited(body):
	target = null
	pass # replace with function body
