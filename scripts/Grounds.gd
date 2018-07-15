extends Node2D

func _ready():
	pass

func _on_fire(bullet, _position, _rotation):
	var b = bullet.instance()
	get_parent().add_child(b)
	b.start(_position, _rotation)
