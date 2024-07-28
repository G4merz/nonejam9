//Herdando as informações do objeto pai
event_inherited()

//Variáveis de movimento
max_vel = 5
acel = 0.3
spd_multi = 1

//Variáveis de desenho
image_spd = 8 / game_get_speed(gamespeed_fps) //Velocidade manual (8 FPS)
def_image_spd = 8 / game_get_speed(gamespeed_fps) //Velocidade manual padrão

sprites = [
			//Sprites Parado
			[
			spr_chefinho_idle_side,
			spr_chefinho_idle_up,
			spr_chefinho_idle_side,
			spr_chefinho_idle_down
			]
]

//Ataque
ataque = 0

//Rolada (lá ele)
roll = 0

//Controlando o player
control = function(){
	//Bindings
	var _up = keyboard_check(vk_up)
	var _left = keyboard_check(vk_left)
	var _down = keyboard_check(vk_down)
	var _right = keyboard_check(vk_right)
	ataque = keyboard_check_pressed(ord("X"))
	roll = keyboard_check_pressed(ord("Z"))

	//Ajustando o lado em que estou olhando (dependendo do estado, não posso mudar a face)
	if(texto_estado = "parado" or texto_estado = "movendo"){
		if(_up) olhando = 1
		if(_left){olhando = 2; xscale = -1}
		if(_down) olhando = 3
		if(_right){olhando = 0; xscale = 1}
	}

	#region Movimento
	if((_up xor _down) or (_left xor _right)){
		//Vendo a direção pra qual estou indo
		var _dir = point_direction(0, 0, (_right - _left), (_down - _up))

		//Calculando as velocidades com base na direção
		var _target_velh = lengthdir_x(max_vel * spd_multi, _dir)
		var _target_velv = lengthdir_y(max_vel * spd_multi, _dir)
	
		//Lerpando a velocidade pra ficar suave
		velh = lerp(velh, _target_velh, acel)
		velv = lerp(velv, _target_velv, acel)
	}else{
		//Se não estiver apertando nenhuma tecla, zero a velocidade
		velh = lerp(velh, 0, acel)
		velv = lerp(velv, 0, acel)
	
		//Arredondando
		if(abs(velh) < 0.2) velh = 0
		if(abs(velv) < 0.2) velv = 0
	}
#endregion
}

//Estados
estado = noone
texto_estado = "parado"

estado_parado = function(){
	texto_estado = "parado"
	
	//Controlando o player
	control()
	
	//Ficando parado
	velh = 0
	velv = 0
	
	//Pegando minhas teclinhas
	var _up = keyboard_check(vk_up)
	var _left = keyboard_check(vk_left)
	var _down = keyboard_check(vk_down)
	var _right = keyboard_check(vk_right)
	
	//Definindo a sprite correta
	animando(0)
	
	//Saindo do estado caso eu me mova
	if((_up xor _down) or (_left xor _right)){
		estado = estado_movendo
	}
	
	//Saindo do estado caso eu ataque
	if(ataque){
		estado = estado_ataque
	}
	
	//Saindo do estado caso eu role
	if(roll){
		estado = estado_esquiva
	}

}

estado_movendo = function(){
	texto_estado = "movendo"
	
	//Definindo a sprite correta
	animando(0)
	
	//Controlando o player
	control()

	//Se eu ficar parado, mudo pro estado parado
	if(velh = 0 and velv = 0){
		estado = estado_parado
	}
	
	//Saindo do estado caso eu ataque
	if(ataque){
		estado = estado_ataque
	}
	
	//Saindo do estado caso eu role
	if(roll){
		estado = estado_esquiva
	}
}

estado_ataque = function(){
	texto_estado = "ataque"
	
	//Definindo a sprite correta
	animando(0)
	
	//Ficando parado
	velh = 0
	velv = 0
	
	//Saindo do estado caso a animação acabe
	if(image_ind + image_spd >= image_num) estado = estado_parado
	
}

estado_esquiva = function(){

	//Mudando minha velocidade logo quando eu entrar no estado
	if(texto_estado != "esquiva"){
		//Bindings (pego as teclas pra manter a rolagem em 8 direções apenas)
		var _up = keyboard_check(vk_up)
		var _left = keyboard_check(vk_left)
		var _down = keyboard_check(vk_down)
		var _right = keyboard_check(vk_right)
	
		var _dir = 0
	
		//Se eu estiver me movendo, rolo para a direção em que estou me movendo
		if((_up xor _down) or (_left xor _right)){
			_dir = point_direction(0, 0, _right - _left, _down - _up)
		}else{ //Caso contrário (estou parado), vou pra direção que estou olhando
			_dir = olhando * 90
		}
		
		velh = lengthdir_x(max_vel * 1.5, _dir)
		velv = lengthdir_y(max_vel * 1.5, _dir)
	}
	
	texto_estado = "esquiva"
	
	//Colocando a sprite certa
	animando(0)
	
	//Saindo do estado caso a animação acabe
	if(image_ind + image_spd >= image_num) estado = estado_parado	
}

estado = estado_parado