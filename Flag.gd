extends Area2D

export (String) var team = "Blue"

var grabbable = true

var initial_position

func _ready():
	initial_position = position
