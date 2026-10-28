extends AnimatableBody2D

@onready var bola: RigidBody2D = $"../Bola"
@onready var areaColisao = $CollisionShape2D
@onready var posicaoInicial_x = global_position.x

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if bola:
		var alturaAlvo = bola.global_position.y
		var limiteTela = get_viewport_rect()
		var distancia = abs(global_position.y - alturaAlvo)
	
		if distancia > 1.0:
			global_position.y = move_toward(global_position.y, alturaAlvo, 650 * delta)

		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == bola:
		print_debug("colidiu")
		AudioManager.tocarSom()
		bola.apply_impulse(Vector2(200,0), Vector2(0,0))
