//Instanciando a câmera
var _c = obj_camera

//Copiando as listas
copy_lists()

confirm = mouse_check_button_pressed(mb_left)
quit = keyboard_check_pressed(vk_escape)

var _prev_pos = 0
var _prev_inv = 0

caixa_option_length = ds_list_size(caixa_option)
player_option_length = ds_list_size(player_option)

#region Fazendo com que seja possível selecionar e clicar com o mouse
for(var i = 0; i < caixa_option_length; i++){
	_prev_pos = pos
	_prev_inv = cur_inventory

	var _x1 = borda_fora + borda
	var _y1 = borda_fora + borda + espaco * i
	var _x2 = borda_fora + width
	var _y2 = _y1 + string_height(caixa_option[| i])
	
	if(point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)){
		pos = i
		cur_inventory = 0
		hovering = true
	}else{
		hovering = false
	}
	
	if(_prev_pos != pos or _prev_inv != cur_inventory){
		audio_play_sound(snd_selection, 1, 0)
	}
	if(hovering) break //Se eu já estiver com o mouse em cima de algo, não rodo novamente.

}
if(ds_list_empty(obj_caixa.caixa)) hovering = false

for(var i = 0; i < player_option_length; i++){
	_prev_pos = pos
	_prev_inv = cur_inventory

	var _x1 = (_c.cw_current - width_2 - borda_fora) + borda
	var _y1 = borda_fora + borda + espaco * i
	var _x2 = _x1 + width_2
	var _y2 = _y1 + string_height(player_option[| i])
	
	if(point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)){
		pos = i
		cur_inventory = 1
		hovering_2 = true
	}else{
		hovering_2 = false
	}
	
	if(_prev_pos != pos or  _prev_inv != cur_inventory){
		audio_play_sound(snd_selection, 1, 0)
	}
	if(hovering_2) break //Se eu já estiver com o mouse em cima de algo, não rodo novamente.

}
if(ds_list_empty(global.inventory)) hovering_2 = false
#endregion

if(quit) instance_destroy()

if(confirm and (hovering or hovering_2)){
	switch(cur_inventory){
		case 0: retrieve_item(); break
		case 1: store_item(); break
	}
}

//Copiando as listas de novo
