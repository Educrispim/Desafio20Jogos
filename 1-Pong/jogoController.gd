extends Node

var pontuacaoJogador: int = 0
var pontuacaoAdversario: int = 0
const TELA_FINAL = preload("uid://87ycg2met5s")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pontuar(pontuador):
	if pontuador == "jogador":
		pontuacaoJogador += 1
		print("jogador marcou ponto")
		if pontuacaoJogador == 8:
			pontuacaoJogador = 0
			pontuacaoAdversario = 0
			terminarJogo()
	else:
		pontuacaoAdversario += 1
		print("adversário marcou ponto")
		if pontuacaoAdversario == 8:
			pontuacaoAdversario = 0
			pontuacaoJogador = 0
			
			terminarJogo()
		

func terminarJogo():
		get_tree().change_scene_to_packed(TELA_FINAL)
