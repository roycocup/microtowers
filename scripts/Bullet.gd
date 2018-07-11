extends KinematicBody2D
var t
 
func _ready():
	t = $Timer
	t.wait_time = 1
	t.one_shot = true
	t.start()

func start(_position, _rotation):
	position = _position
	rotation = _rotation
	pass

func _physics_process(delta):
	if t.is_stopped():
		queue_free()
	else:
		translate(Vector2(10, 0).rotated(rotation))
	
