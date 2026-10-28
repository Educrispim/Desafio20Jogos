extends CharacterBody2D


const SPEED = 350.0
@onready var areaColisao = $CollisionShape2D
@onready var posicaoInicial_x = global_position.x
@onready var bola: RigidBody2D = $"../Bola"
@export var restituicao: float = 0.8
@onready var barra: CharacterBody2D = $"."

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("ui_up"):
		position.y -= 10 
	elif Input.is_action_pressed("ui_down"):
		position.y += 10 
		
	var limiteTela = get_viewport_rect()
	var limiteBarra = areaColisao.shape.get_rect()
	var diferenca = limiteBarra.position.y + barra.position.y
	var diferenca2 = limiteBarra.end.y + barra.position.y 
	
	
	print(diferenca2)
	global_position.y = clamp(global_position.y, limiteTela.position.y - diferenca, limiteTela.end.y - diferenca2 )
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
		if body == bola:
			bola.apply_impulse(Vector2(-200,0), Vector2(0,0))
			AudioManager.tocarSom()
			global_position.x = posicaoInicial_x
