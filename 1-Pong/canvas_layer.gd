extends CanvasLayer

@onready var pontjogador: Label = $Control/pontjogador
@onready var pontadversario: Label = $Control/pontadversario



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pontjogador.text = str(JogoController.pontuacaoJogador)
	pontadversario.text = str(JogoController.pontuacaoAdversario)
