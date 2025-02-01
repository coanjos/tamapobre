extends Node2D

class_name Jogo

@onready var texture_button: TextureButton = $UI/TextureButton

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	SignalManager.alimentou_tamagotchi.emit()

func _on_area_2d_mouse_entered() -> void:
	print('prints loucos')

func _on_texture_button_mouse_entered() -> void:
	texture_button.modulate = "ffffff"

func _on_texture_button_mouse_exited() -> void:
	texture_button.modulate = "ffffff82"
