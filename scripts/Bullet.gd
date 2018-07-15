extends KinematicBody2D
var timer
export (int) var speed
 
func _ready():
	timer = $Timer
	timer.wait_time = 1
	timer.one_shot = true
	timer.start()

func start(_position, _rotation):
	position = _position
	rotation = _rotation
	pass

func _physics_process(delta):
	if timer.is_stopped():
		queue_free()
	else:
		translate(Vector2(speed, 0).rotated(rotation))
	
