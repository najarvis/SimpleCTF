extends Light2D

var pos = Vector2()
var ipos
var base_scale
var total_time = 0
var my_id = randi()

func _ready():
	ipos = position
	base_scale = energy

func luminosity_function(base_luminosity, id=0):
	# Returns the brightness of a light at a certain point in time (to animate)
	# You can just pass the light id so that each light isn't in sync.
	
	var angular_frequency = 6
	var variance = 0.5
	
	# This function looks kind of scary, but it's just a basic combination of harmonic functions to
	# produce something that kind of looks random but isn't inherently.
	var brightness = variance * 0.0100 * sin(angular_frequency * 1.0 * total_time + id) + \
	                 variance * 0.0100 * sin(angular_frequency * 2.1 * total_time + PI + id) + \
					 variance * 0.0047 * sin(angular_frequency * 4.9 * total_time + id) + \
					 base_luminosity

	return brightness

func _process(delta):
	total_time += delta
	pos.x = sin(total_time) * 100.0
	
	position = pos + ipos
	
	#texture_scale = luminosity_function(base_scale, my_id)
	energy = luminosity_function(base_scale, my_id)