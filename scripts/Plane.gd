extends KinematicBody2D

export (int) var speed = 1
export (float) var rotation_speed = 1.5
export (PackedScene) var bullet

var bullets
var can_shoot


func _ready():
	can_shoot = true
	pass

func fire():
	var b = bullet.instance()
	add_child(b)

func get_input(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		rotate(rotation_speed * delta)
	if Input.is_key_pressed(KEY_LEFT):
		rotate(-rotation_speed * delta)
	if Input.is_key_pressed(KEY_Z):
		fire()


func _physics_process(delta):
	get_input(delta)
	translate(Vector2(speed,0).rotated(rotation))
