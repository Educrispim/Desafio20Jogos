extends CharacterBody2D


const SPEED = 350.0
@onready var areaColisao = $CollisionShape2D
@onready var posicaoInicial_x = global_position.x

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("ui_up"):
		position.y -= 5 
	elif Input.is_action_pressed("ui_down"):
		position.y += 5 
		
	var limiteTela = get_viewport_rect()
	var limiteBarra = areaColisao.shape.get_rect()
	
	global_position.y = clamp(global_position.y, limiteTela.position.y - limiteBarra.position.y, limiteTela.end.y - limiteBarra.end.y)
	

	
	move_and_slide()
	_empurrar()
	
func _empurrar() -> void:
	for i in range(get_slide_collision_count()):
			var colisao = get_slide_collision(i)
			print_debug("colisão com:"+ colisao.get_collider().name)
			global_position.x = posicaoInicial_x
			var objeto = colisao.get_collider()
			objeto.linear_velocity *= 1.1
			objeto.apply_impulse(Vector2(-200,0), Vector2(0,0))
