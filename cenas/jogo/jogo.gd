extends Node2D

class_name Jogo

@onready var texture_button: TextureButton = $UI/TextureButton
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var sprite_btn: Sprite2D = $UI/Minigames/Sprite
@onready var minigames_button: TextureButton = $UI/MinigamesButton

const MINIGAME_NAVE: PackedScene = preload("res://cenas/jogo/minigames/minigame_nave.tscn")

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	SignalManager.alimentou_tamagotchi.emit()
	audio_player.play()

func _on_texture_button_mouse_entered() -> void:
	texture_button.modulate = "ffffff"

func _on_texture_button_mouse_exited() -> void:
	texture_button.modulate = "ffffff82"
	
func _on_minigames_button_pressed() -> void:
	SceneManager.carregar_minigame_nave()

func _on_minigames_mouse_entered() -> void:
	minigames_button.modulate = "ffffff"

func _on_minigames_mouse_exited() -> void:
	minigames_button.modulate = "ffffff82"
