adjust_depth()

//Se eu estiver a 1 pixel de distância do player e a tecla "Z" for apertada, o menu abre.
with(obj_chefinho){
	if(place_meeting(x + lengthdir_x(3, olhando * 90), y + lengthdir_y(3, olhando * 90), other) 
	and keyboard_check_pressed(ord("Z"))
	and !instance_exists(obj_forno_menu)){
		create_menu("forno")
	}
}