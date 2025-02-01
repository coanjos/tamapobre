extends Node2D

class_name Pet

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const VELOCIDADE: float = 100.0
const PIXEL_STEP: int = 16

var _fome: float = 1000.0
var _diversao: float = 1000.0
var _higiene: float = 1000.0
var _posicao_inicial: float

func _ready() -> void:
	SignalManager.alimentou_tamagotchi.connect(_on_alimentou)
	_posicao_inicial = position.y
		
func _process(delta: float) -> void:
	oscilar(1) 
	processar_necessidades(delta)
		
func decrementar_necessidade(valor: float, delta: float) -> float:
	valor -= VELOCIDADE * delta
	
	if valor <= 0:
		return 0
	else:
		return valor
		
func oscilar(intensidade: float) -> void:	
	if position.y < _posicao_inicial + PIXEL_STEP:
		await get_tree().create_timer(intensidade).timeout
		position.y += PIXEL_STEP
	else:
		position.y -= PIXEL_STEP
		
func processar_necessidades(delta: float) -> void:
	_fome = decrementar_necessidade(_fome, delta)
	_diversao = decrementar_necessidade(_diversao, delta)
	_higiene = decrementar_necessidade(_higiene, delta)
	
	if _fome < 500:
		print('COM FOME')
		
func _on_alimentou():
	_fome = 1000.0
	print(_fome)
	animation_player.play("sorriso")
	await get_tree().create_timer(1.2).timeout
	animation_player.play("idle")
	
	
	
