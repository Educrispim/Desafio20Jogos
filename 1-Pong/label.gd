extends Label

@onready var textoVencedor: Label = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mudarTexto()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mudarTexto():
	if JogoController.pontuacaoJogador == 8:
		textoVencedor.text = "Você Venceu!"
	elif JogoController.pontuacaoAdversario == 8:
		textoVencedor.text = "Você perdeu!"
		
