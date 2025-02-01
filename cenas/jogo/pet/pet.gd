extends Node2D

class_name Pet

const VELOCIDADE: float = 100.0

var _fome: float = 1000.0
var _diversao: float = 1000.0
var _higiene: float = 1000.0

func _ready() -> void:
	SignalManager.alimentou_tamagotchi.connect(_on_alimentou)	
	
func _process(delta: float) -> void:
	_fome = decrementar_necessidade(_fome, delta)
	_diversao = decrementar_necessidade(_diversao, delta)
	_higiene = decrementar_necessidade(_higiene, delta)
	
	if _fome < 500:
		print('COM FOME')
		
func decrementar_necessidade(valor: float, delta: float) -> float:
	valor -= VELOCIDADE * delta
	
	if valor <= 0:
		return 0
	else:
		return valor
		
func _on_alimentou():
	_fome = 1000.0
	print(_fome)
