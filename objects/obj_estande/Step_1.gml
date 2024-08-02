adjust_depth()

//Se eu estiver a 1 pixel de distância do player e a tecla "Z" for apertada, o menu abre.
with(obj_chefinho){
	if(place_meeting(x + lengthdir_x(1, olhando*90), y + lengthdir_y(1, olhando*90), other)
	and keyboard_check_pressed(ord("Z"))
	and !global.shooting
	and global.shooting_delay = 0){
		enter_shooter(other.mode)
	}
}