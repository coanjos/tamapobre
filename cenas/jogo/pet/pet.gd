extends Node2D

class_name Pet

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var _posicao_inicial: float

func _ready() -> void:
	SignalManager.alimentou_tamagotchi.connect(_on_alimentou)
	_posicao_inicial = position.y
		
func _process(_delta: float) -> void:
	oscilar(1) 
		
func oscilar(intensidade: float) -> void:	
	if position.y < _posicao_inicial + Constants.PIXEL_STEP:
		await get_tree().create_timer(intensidade).timeout
		position.y += Constants.PIXEL_STEP
	else:
		position.y -= Constants.PIXEL_STEP
	
func _on_alimentou() -> void:
	animation_player.play("sorriso")
	await get_tree().create_timer(1).timeout
	animation_player.play("idle")
