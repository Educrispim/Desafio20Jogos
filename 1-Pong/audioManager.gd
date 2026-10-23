extends Node

# Carrega o som diretamente para a memória
const HIT = preload("res://sounds/Hit.wav")

func tocarSom() -> void:
	# Cria um AudioStreamPlayer temporário via código
	var player = AudioStreamPlayer.new()
	player.stream = HIT
	
	# Adiciona o player na árvore de cena temporariamente
	add_child(player)
	
	# Toca o som
	player.play()
	
	# Apaga o player da memória automaticamente assim que o som terminar de tocar
	player.finished.connect(player.queue_free)
