/*Criando uma variável temporária para acessar a DS List de itens sendo segurados
pelo player de forma mais legível e fácil*/
var _list = chef.picked_items
var _pos_in_list = ds_list_find_index(_list, id)

//Definindo o nome de acordo com meu index
nome = nomes[index]

/*Caso eu colida com o player, eu mudo a variável "picked" para true, e me adiciono
na DS List do player se eu ainda não estiver lá*/
if(place_meeting(x, y, chef)){
	picked = true
	if(_pos_in_list = -1) ds_list_add(_list, id)
}

//Se estou sendo segurado, mudo minha posição para seguir o player
if(picked){
	xx = lerp(xx, chef.x - (chef.velh * _pos_in_list), 0.5 -  min((0.05 * _pos_in_list), 0.25))
	yy = lerp(yy, chef.y - 36 - (10 * _pos_in_list), 0.45 - min((0.04 * _pos_in_list), 0.25))
	
	img_angle = lerp_direction(img_angle, _pos_in_list * 12 * sign(round(chef.velh)), 0.2)
	
	x = xx
	y = yy
	image_angle = img_angle
	
	//Deixando minha profundidade menor que a do player
	depth = chef.depth - 300 - _pos_in_list
}else{
	adjust_depth()
}

