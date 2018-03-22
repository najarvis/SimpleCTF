extends Area2D

var pos = Vector2()
var vel = Vector2()

export (int) var speed = 10

var max_speed = 100

func _ready():
	pass

func _process(delta):
	var acc = Vector2()
	if Input.is_key_pressed(KEY_W):
		acc.y -= 1
	if Input.is_key_pressed(KEY_S):
		acc.y += 1
	if Input.is_key_pressed(KEY_A):
		acc.x -= 1
	if Input.is_key_pressed(KEY_D):
		acc.x += 1
		
	vel += acc.normalized()
	if vel.length() > max_speed:
		vel = vel.normalized() * max_speed
	else:
		vel *= 0.95
	pos += vel * delta * speed
	
	position = pos