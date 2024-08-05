balas = 0
pedidos = 0
pedidos_perdidos = 0

pontos = 0
bonus_dificuldade = [0, 20, 60, 100]
rank = [30, 100, 150, 180, 250, 400]
rank_messages = [
				"[shake]Acho que você quebrou o fogão...",
				"Faltou sal.",
				"Nem ruim, nem bom.",
				"Alguns voltariam para comer novamente.",
				"Seu restaurante ficou famoso até entre os aliens!",
				"[wave][rainbow]Vous êtes un exemple du métier!"
				]
				
index = 0
ended = false

intervalo_rank = seconds(.5)
espera_rank = intervalo_rank
scale_rank = 1.25

state = 0
cd_state = seconds(2.5)
espera_state = cd_state

draw_balas = false
draw_pedidos = false
draw_pedidos_perdidos = false

shake_balas = 2
shake_pedidos = 2
shake_pedidos_perdidos = 2

b_alpha = 1

pitch = 0.8

sequence = noone