//Herdando as informações do objeto pai
event_inherited()

//Variáveis de movimento
max_vel = 5
acel = 0.3
spd_multi = 1

tempo_dash = seconds(0.75)
espera_dash = 0

//Variáveis de desenho
image_spd = 6 / game_get_speed(gamespeed_fps) //Velocidade manual (8 FPS)
def_image_spd = 6 / game_get_speed(gamespeed_fps) //Velocidade manual padrão

sprites = [
			//Sprites Parado
			[
			spr_chefinho_idle_side,
			spr_chefinho_idle_up,
			spr_chefinho_idle_side,
			spr_chefinho_idle_down
			]
]

//Controlando o player
control = function(){
	//Bindings
	var _up = keyboard_check(vk_up)
	var _left = keyboard_check(vk_left)
	var _down = keyboard_check(vk_down)
	var _right = keyboard_check(vk_right)
	var _dash = keyboard_check_pressed(ord("C"))

	//Ajustando o lado em que estou olhando (dependendo do estado, não posso mudar a face)
	if(texto_estado = "parado" or texto_estado = "movendo"){
		if(_up) olhando = 1
		if(_down) olhando = 3
		if(_left){olhando = 2; xscale = -1}
		if(_right){olhando = 0; xscale = 1}
	}
	
	#region Dash
	//Se eu apertar "C", aumento minha velocidade por um breve momento e reseto o timer do dash
	if(_dash and (abs(velh) > 0 or abs(velv) > 0)){
		spd_multi = 3
		espera_dash = tempo_dash
	}	
	
	//Voltando e arredondando o multiplicador de velocidade para o normal
	spd_multi = lerp(spd_multi, 1, 0.25)
	if(spd_multi < 1.1) spd_multi = 1
	
	//Descendo o cooldown do dash
	espera_dash--
	
	#endregion
	
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
	
}

estado = estado_parado