extends Node2D

const JOGO = preload("res://cenas/jogo/jogo.tscn")

func _process(delta: float) -> void:
	await get_tree().create_timer(3).timeout
	SignalManager.banhou_tamagotchi.emit()
	SceneManager.carregar_cena_jogo()
