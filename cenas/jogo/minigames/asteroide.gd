extends Area2D

class_name Asteroide

signal asteroide_explodiu

func _process(_delta: float) -> void:
	position.y += Constants.PIXEL_STEP / 2.0

func _on_area_entered(area: Area2D) -> void:
	if area is Tiro:
		asteroide_explodiu.emit()
		self.queue_free()
