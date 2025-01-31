extends Node

const JOGO: PackedScene = preload("res://cenas/jogo/jogo.tscn")

func carregar_cena_jogo() -> void:
	get_tree().change_scene_to_packed(JOGO)
