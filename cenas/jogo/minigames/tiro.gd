extends Area2D

class_name Tiro

func _process(delta: float):	
	position.y -= Constants.PIXEL_STEP
