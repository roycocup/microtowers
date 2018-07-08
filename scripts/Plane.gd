extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5
var velocity = Vector2()
var rotation_dir = 0

func _ready():
	pass

func fire():
	pass

func get_input(delta):
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_key_pressed(KEY_RIGHT):
		rotate(rotation_speed * delta)
	if Input.is_key_pressed(KEY_LEFT):
		rotate(-rotation_speed * delta)
	if Input.is_key_pressed(KEY_Z):
		fire()


func _physics_process(delta):
	get_input(delta)
	translate(Vector2(1,0).rotated(rotation))
