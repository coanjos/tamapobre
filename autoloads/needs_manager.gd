extends Node

var _fome: float = 1000.0
var _higiene: float = 10000.0
var _diversao: float = 1000.0
var _energia: float = 10000.0

func _ready() -> void:
	SignalManager.alimentou_tamagotchi.connect(_on_alimentou)
	SignalManager.divertiu_tamagotchi.connect(_on_divertiu)
	SignalManager.banhou_tamagotchi.connect(_on_banhou)
	SignalManager.deitou_tamagotchi.connect(_on_deitou)
	
func _process(delta: float) -> void:
	processar_necessidades(delta)

func processar_necessidades(delta: float) -> void:
	_fome = decrementar_necessidade(_fome, delta)
	_higiene = decrementar_necessidade(_higiene, delta)
	_diversao = decrementar_necessidade(_diversao, delta)	
	_energia = decrementar_necessidade(_higiene, delta)	

func decrementar_necessidade(valor: float, delta: float) -> float:
	valor -= Constants.VELOCIDADE * delta
	
	if valor <= 0:
		return 0
	else:
		return valor
		
func _on_alimentou() -> void:
	_fome += 100
	
func _on_divertiu(pontos: float) -> void:	
	_diversao += pontos * 10.0
	
func _on_banhou() -> void:
	_higiene = 10000.0
	
func _on_deitou() -> void:
	_energia = 10000.0
