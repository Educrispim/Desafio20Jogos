extends RigidBody2D

@onready var tempo = $Timer
var posicaoinicial: Vector2
var direcao = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	posicaoinicial = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	if global_position.x > 3000 or global_position.x < -1305:
		print_debug("passou do limite")
		reiniciar()


func _on_timer_timeout():
	if direcao:
			apply_impulse(Vector2(50,0), Vector2(0,0))
	else: 
			apply_impulse(Vector2(-50,0), Vector2(0,0))
	print_debug("força")
	
func reiniciar() -> void:
	direcao = !direcao
	global_position = posicaoinicial
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	$Timer.stop()
	$Timer.start()
