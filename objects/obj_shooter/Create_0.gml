//Profundidade
depth = -1500

//Transparência dos elementos
alpha = 0

//Emissor de partículas
partem = part_emitter_create(obj_sys.partsys)

//X e Y da mira
mirax = mouse_x
miray = mouse_y
mirar = 12 //Raio de alcance do tiro

//Shake da arma
arma_shake = 5

//Sequencia de transição
sequence = noone

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
tempo_entidade = seconds(1)
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

burst = function(_x, _y, _sprw, _sprh){	
	part_emitter_region(obj_sys.partsys, partem, _x-_sprw, _x+_sprw, _y-_sprh, _y+_sprh, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(obj_sys.partsys, partem, obj_sys.partype, 10);
	part_emitter_burst(obj_sys.partsys, partem, obj_sys.partype2, 20);
}