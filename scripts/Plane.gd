extends KinematicBody2D

export (int) var original_speed = 1
export (int) var speed_multiplier = 2
export (float) var rotation_speed = 1.5
export (PackedScene) var bullet
var speed = 0
var bullet_pool = []


func _ready():
	create_bullet_pool()
	pass

func create_bullet_pool():
	for i in range(100):
		var b = bullet.instance()
		get_parent().add_child(b)
		b.hide()
		bullet_pool.append(b)

func fire():
	var last = bullet_pool.size()
	var b = bullet_pool[last - 1]
	get_parent().add_child(b)
	b.status = b.MOVING
	b.show()
	b.start($Spawn.global_transform.origin, rotation)
	
func get_input(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		rotate(rotation_speed * delta)
	if Input.is_key_pressed(KEY_LEFT):
		rotate(-rotation_speed * delta)
	if Input.is_key_pressed(KEY_Z):
		fire()
	if Input.is_key_pressed(KEY_X):
		speed = speed_multiplier * original_speed		
	else:
		speed = original_speed

func _physics_process(delta):
	get_input(delta)
	translate(Vector2(speed,0).rotated(rotation))

