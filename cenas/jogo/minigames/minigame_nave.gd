extends Node2D

const TIRO = preload("res://cenas/jogo/minigames/tiro.tscn")
const ASTEROIDE = preload("res://cenas/jogo/minigames/asteroide.tscn")

@onready var nave: Area2D = $Nave
@onready var som_tiro: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer
@onready var player_explosao: AudioStreamPlayer = $PlayerExplosao
@onready var explosao: Sprite2D = $explosao
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label_score: Label = $Panel/LabelScore

var _score: int = 0

func _ready() -> void:
	spawn_asteroide()
	explosao.visible = false
		
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		spawn_tiro()
	
func spawn_tiro() -> void:
	var new_tiro = TIRO.instantiate()
	new_tiro.position = nave.position
	new_tiro.z_index = -999
	add_child(new_tiro)
	som_tiro.play()
	
func spawn_asteroide() -> void:
	var new_asteroide = ASTEROIDE.instantiate()	
	var xpos: float = randi_range(0, 32)
	new_asteroide.position = Vector2(xpos * Constants.PIXEL_STEP, -50)
	new_asteroide.z_index = -999
	new_asteroide.asteroide_explodiu.connect(_on_asteroide_explodiu)
	add_child(new_asteroide)
	
func stop_all() -> void:
	timer.stop()
	for child in get_children():
		child.set_process(false)
		
func explosao_morte() -> void:
	player_explosao.play()
	explosao.position = Vector2(nave.position.x, nave.position.y)
	nave.queue_free()	
	explosao.visible = true
	animation_player.play("explosao")	
		
func game_over() -> void:
	stop_all()
	explosao_morte()
	await get_tree().create_timer(2).timeout
	SceneManager.carregar_cena_jogo()

func _on_timer_timeout() -> void:
	spawn_asteroide()
	
func _on_asteroide_explodiu() -> void:
	player_explosao.play()
	_score += 1
	label_score.text = "%05d" % _score	

func _on_nave_area_entered(area: Area2D) -> void:
	if area is Asteroide:
		area.queue_free()	
		game_over()
