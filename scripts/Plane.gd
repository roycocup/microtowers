extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5
export (PackedScene) var bullet
var can_shoot

func _ready():
	can_shoot = true
	pass

func fire():
	if can_shoot:
		can_shoot = false
		emit_signal('fire', Bullet, $Turret/Muzzle.global_position, dir)
		#$AnimationPlayer.play('muzzle_flash')

func get_input(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		rotate(rotation_speed * delta)
	if Input.is_key_pressed(KEY_LEFT):
		rotate(-rotation_speed * delta)
	if Input.is_key_pressed(KEY_Z):
		fire()


func _physics_process(delta):
	get_input(delta)
	translate(Vector2(1,0).rotated(rotation))
