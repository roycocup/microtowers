extends KinematicBody2D

export (int) var speed = 1
export (float) var rotation_speed = 1.5
export (PackedScene) var bullet

signal fire

func _ready():
	pass

func fire():
	emit_signal("fire", bullet, $spawn.global_transform.origin, rotation)

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
