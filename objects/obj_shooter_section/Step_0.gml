//Mudando o alpha de acordo com se estou no modo de tiro ou não
alpha = approach(alpha, (global.shooting) ? 1 : 0, 0.1)

//Saindo do modo de tiro caso eu esteja nele
if(keyboard_check_pressed(ord("X")) and global.shooting_delay = 0 and global.shooting){
	quit_shooter()
}

//Diminuindo o delay
global.shooting_delay = approach(global.shooting_delay, 0, 1)

#region Mira e tiros

//Se eu estiver no modo de tiro, escondo o mouse
if(global.shooting) window_set_cursor(cr_none)
else window_set_cursor(cr_arrow)

var _tiro = mouse_check_button_released(mb_left) //Botão do tiro

//Se eu estiver no modo de tiro e atirar, rodo o código abaixo
if(_tiro and global.shooting and espera_tiro = 0){
	audio_play_sound(snd_tiro, 1, 0)
	espera_tiro = tempo_tiro
}

//Diminuindo o cooldown
espera_tiro = approach(espera_tiro, 0, 1)

#endregion