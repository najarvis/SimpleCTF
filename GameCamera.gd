extends Camera2D

func _ready():
	position = Vector2(1920, 1080) / 2
	
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_DOWN:
			zoom *= 1.1
		if event.button_index == BUTTON_WHEEL_UP:
			zoom /= 1.1