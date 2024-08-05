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

if(sequence != -1){
	if(layer_sequence_get_headpos(sequence) = 59){
		enter_shooter(mode)
	}
	
	if(layer_sequence_is_finished(sequence)){
		layer_sequence_destroy(sequence)
	}
}

e_alpha = approach(e_alpha, next_to_player, 0.1)