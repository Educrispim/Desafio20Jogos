extends RigidBody2D

@export var velocidadeConstante: float = 800.0
@onready var posicaoInicial = global_position

func _ready() -> void:
		var direcaoInicial = Vector2(randf_range(-1, 1), randf_range(-0.1, 0.1)).normalized()
		linear_velocity = direcaoInicial * velocidadeConstante

func _process(delta: float) -> void:
	if position.x > 1200:
		JogoController.pontuar("adversario")
		global_position = posicaoInicial
	elif position.x < -200:
		JogoController.pontuar("jogador")
		global_position = posicaoInicial

	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if state.linear_velocity.length() > 0:
		state.linear_velocity = state.linear_velocity.normalized() * velocidadeConstante
		
	for i in range(state.get_contact_count()):
		var collider = state.get_contact_collider_object(i)
		
		if collider and (collider.is_in_group("player") or collider.is_in_group("adversario")):
			var normal = state.get_contact_local_normal(i)
			var direcaoAtual = state.linear_velocity.normalized()
			var novadirecao = direcaoAtual.bounce(normal)
			
			var hitY = state.get_contact_local_position(i).y
			var barraCentroY = collider.global_position.y
			var diferencaAltura = hitY - barraCentroY
			
			var fatorImpacto = diferencaAltura / 40.0
			fatorImpacto = clamp(fatorImpacto, -1.0, 1.0)
			
			novadirecao.y += fatorImpacto * 0.7
			
			
			state.linear_velocity = novadirecao.normalized() * velocidadeConstante
			
			if abs(state.linear_velocity.y) < 50.0:
				state.linear_velocity.y += 100.0 * sign(state.linear_velocity.y if state.linear_velocity.y != 0 else 1)
				state.linear_velocity = state.linear_velocity.normalized() * velocidadeConstante
				break
