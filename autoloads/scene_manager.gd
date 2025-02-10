extends Node

const JOGO: PackedScene = preload("res://cenas/jogo/jogo.tscn")
const MINIGAME_NAVE: PackedScene = preload("res://cenas/jogo/minigames/minigame_nave.tscn")
const BANHO: PackedScene = preload("res://cenas/jogo/banho/banho.tscn")
const SONO = preload("res://cenas/jogo/sono/sono.tscn")

func carregar_cena_jogo() -> void:
	get_tree().change_scene_to_packed(JOGO)

func carregar_minigame_nave() -> void:
	get_tree().change_scene_to_packed(MINIGAME_NAVE)
	
func carregar_cena_banho() -> void:
	get_tree().change_scene_to_packed(BANHO)
	
func carregar_cena_sono() -> void:
	get_tree().change_scene_to_packed(SONO)
