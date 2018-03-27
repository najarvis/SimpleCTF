extends Area2D

var pos = Vector2()
var vel = Vector2()

export (int) var speed = 10
export (String) var team = "Red"

var max_speed = 300

var carrying = null

var score = 0

func _ready():
	pass

func _process(delta):
	var move_direction = Vector2()
	if Input.is_key_pressed(KEY_W):
		move_direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		move_direction.y += 1
	if Input.is_key_pressed(KEY_A):
		move_direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		move_direction.x += 1
		
	var acc_fac = 0.1
	vel += ((move_direction.normalized() * max_speed) - vel) * acc_fac
		
	#vel += acc.normalized()
	#if vel.length() > max_speed:
	#	vel = vel.normalized() * max_speed
	#else:
	#	vel *= 0.95
	
	pos += vel * delta
	position = pos
	
	for area in get_overlapping_areas():
		if area.get("team") != team and area.get("grabbable"):
			grab(area)
			
		if area.get("team") == team and area.get("type") == "Pedestal" and carrying:
			return_object(true)
			
	if Input.is_key_pressed(KEY_SPACE) and carrying:
		return_object(false)
			
func grab(area):
	if not (area in get_children()):
		area.get_parent().remove_child(area)
		add_child(area)
		area.scale = Vector2(1.0, 1.0) / scale
		area.position = Vector2(0, 0)
		area.z_index = -1
		carrying = area
		
func return_object(success):
	carrying.scale = Vector2(1.0, 1.0)
	carrying.position = carrying.initial_position
	carrying.z_index = 0
	remove_child(carrying)
	get_parent().add_child(carrying)
	carrying = null
	if success:
		score += 1