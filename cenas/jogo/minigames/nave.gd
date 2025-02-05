extends Area2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		position.x -= Constants.PIXEL_STEP
	elif Input.is_action_just_pressed("right"):
		position.x += Constants.PIXEL_STEP
