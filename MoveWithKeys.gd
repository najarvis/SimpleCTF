extends Sprite

var pos
export (int) var speed

func _ready():
	pos = position

func _process(delta):
	if Input.is_key_pressed(KEY_W):
		pos.y -= speed * delta
	if Input.is_key_pressed(KEY_S):
		pos.y += speed * delta
	if Input.is_key_pressed(KEY_A):
		pos.x -= speed * delta
	if Input.is_key_pressed(KEY_D):
		pos.x += speed * delta
		
	position = pos
