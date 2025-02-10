extends Node2D

class_name Jogo

@onready var alimento_button: TextureButton = $UI/AlimentoButton
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var minigames_button: TextureButton = $UI/MinigamesButton
@onready var higiene_button: TextureButton = $UI/HigieneButton
@onready var energia_button: TextureButton = $UI/EnergiaButton

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	pass

func _on_alimento_button_pressed() -> void:
	SignalManager.alimentou_tamagotchi.emit()
	audio_player.play()

func _on_alimento_button_mouse_entered() -> void:
	alimento_button.modulate = "ffffff"

func _on_alimento_button_mouse_exited() -> void:
	alimento_button.modulate = "ffffff82"
	
func _on_minigames_button_pressed() -> void:
	SceneManager.carregar_minigame_nave()

func _on_minigames_mouse_entered() -> void:
	minigames_button.modulate = "ffffff"

func _on_minigames_mouse_exited() -> void:
	minigames_button.modulate = "ffffff82"

func _on_higiene_button_pressed() -> void:
	SceneManager.carregar_cena_banho()

func _on_higiene_button_mouse_entered() -> void:
	higiene_button.modulate = "ffffff"

func _on_higiene_button_mouse_exited() -> void:
	higiene_button.modulate = "ffffff82"

func _on_energia_button_pressed() -> void:
	SceneManager.carregar_cena_sono()	

func _on_energia_button_mouse_entered() -> void:
	energia_button.modulate = "ffffff"

func _on_energia_button_mouse_exited() -> void:
	energia_button.modulate = "ffffff82"
