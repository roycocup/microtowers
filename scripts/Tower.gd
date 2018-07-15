extends Node2D

export (PackedScene) var bullet
export (float) var rotation_speed = 2
export (float) var detect_radius = 40
var target
signal fire 
var cooldown
export (float) var cooldown_time = .05

func _ready():
	cooldown = $Cooldown
	cooldown.wait_time = cooldown_time
	cooldown.one_shot = true
	cooldown.stop()
	target = null

func _process(delta):
	if (target != null):
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated(global_rotation)
		global_rotation = current_dir.linear_interpolate(target_dir, rotation_speed * delta).angle()
		fire()


func _on_Radar_body_entered(body):
	target = body

func _on_Radar_body_exited(body):
	target = null
	
func fire():
	print(cooldown.is_stopped())
	if cooldown.is_stopped():
		emit_signal("fire", bullet, $Spawn.global_transform.origin, rotation)
		cooldown.start()
	
	
