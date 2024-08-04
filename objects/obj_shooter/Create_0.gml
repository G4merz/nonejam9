//Profundidade
depth = -1500

//Transparência dos elementos
alpha = 0

//X e Y da mira
mirax = mouse_x
miray = mouse_y
mirar = 12 //Raio de alcance do tiro

//Shake da arma
arma_shake = 5

//Primeira vez entrando no shooter
first_time = true

//Centro da tela (pra facilitar)
center_x = 0
center_y = 0

//Cooldown do tiro
tempo_tiro = seconds(1)
espera_tiro = 0
played = true

//Cooldown de spawn de entidades
tempo_entidade = seconds(.5)
espera_entidade = tempo_entidade

//Input do tiro
shot_input_array = []
shot_buffer_frames = 6

shot_input = function(){
	//Verificando se o botão de pulo foi apertado nos últimos frames
	for(var i = 0; i < min(array_length(shot_input_array), shot_buffer_frames); i++){
		var _shot = shot_input_array[i]
		if(_shot){
			return true	
		}
	}
}