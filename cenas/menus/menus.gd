extends Control

class_name Menus

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_key_label_pressed(KEY_SPACE):
		SceneManager.carregar_cena_jogo()
