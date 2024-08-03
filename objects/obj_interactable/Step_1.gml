adjust_depth()

//Se eu estiver a 1 pixel de distância do player e a tecla "Z" for apertada, o menu abre.
with(obj_chefinho){
	other.next_to_player = place_meeting(x + lengthdir_x(1, olhando*90), y + lengthdir_y(1, olhando*90), other)
	
	if(other.next_to_player
	and keyboard_check_pressed(ord("E"))
	and !global.paused){
		other.action()
	}
}

e_alpha = approach(e_alpha, next_to_player, 0.1)