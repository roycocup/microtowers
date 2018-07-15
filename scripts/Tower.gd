extends Node2D

var target
export (float) var rotation_speed = 2
export (float) var detect_radius = 40

func _ready():
	target = null


func _process(delta):
	if (target != null):
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated(global_rotation)
		global_rotation = current_dir.linear_interpolate(target_dir, rotation_speed * delta).angle()


func _on_Radar_body_entered(body):
	target = body
	$Radar/CollisionShape2D.show()


func _on_Radar_body_exited(body):
	target = null
