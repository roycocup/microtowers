extends Node2D

var target
export var rotation_speed = 2;

func _ready():
	target = null


func _process(delta):
	if (target != null):
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated(global_rotation)
		global_rotation = current_dir.linear_interpolate(target_dir, rotation_speed * delta).angle()


func addRadius():
	var circle = CircleShape2D.new()
	$Radar/CollisionShape2D.shape = circle
	$Radar/CollisionShape2D.shape.radius = detect_radius

func _on_Radar_body_entered(body):
	target = body


func _on_Radar_body_exited(body):
	target = null
