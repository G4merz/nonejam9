#region Approach
/// @function				approach(_val, _target, _amount)
/// @param {real} _val		Valor que eu vou mudar
/// @param {real} _target	Valor que eu quero chegar
/// @param {real} _amount	Quanto eu vou mover o valor

function approach(){
	if (argument0 < argument1)
{
    argument0 += argument2;
    if (argument0 > argument1)
        return argument1;
}
else
{
    argument0 -= argument2;
    if (argument0 < argument1)
        return argument1;
}

return argument0;
}

#endregion

#region Chance
/// @function				chance(_chance)
/// @param {real} _chance	Chance (de 0 a 1)

/*Essa função gera um número aleatório entre 0 e 1, e retorna se aquele número é menos
do que o número desejado*/
function chance(_chance){
	return _chance > random(1);
}

#endregion

#region Seconds
/// @function				seconds(_sec)
/// @param {real} _sec		Segundos

//Essa função retorna o valor em segundos (baseado no fps) desejado
function seconds(_sec){
	return _sec * FPS
}
#endregion

#region Wave
/// @function				wave(_min, _max, _duration)
/// @param {real} _min		Valor Mínimo
/// @param {real} _max		Valor Máximo
/// @param {real} _duration	Duração do ciclo

//Sinceramente não sei como essa função funciona, mas ela faz uns cálculos doidos.
function wave(){
a4 = (argument1 - argument0) * 0.5;
return argument0 + a4 + sin((((current_time * 0.001) + argument2) / argument2) * (pi*2)) * a4;
}

#endregion

#region Array Insert Shift

/*Essa função funciona da seguinte maneira: ela lê os valores do array, em ordem 
decrescente, e sobe a posição desses valores até chegar na posição desejada. Fazendo
isso, ela abre um espaço no array sem remover nenhum valor. No fim, o valor desejado é
colocado na posição desejada.*/
function array_insert_shift(_array, _pos, _value){
	for (var i = array_length(_array); i > _pos; i--){
	  _array[i] = _array[i - 1];
	}
	// insert
	_array[_pos] = _value
}

#endregion

#region Adjust Depth

function adjust_depth(){
	depth = -y
}

#endregion

#region Lerp Direction
/// @desc lerp específico para ângulos
/// @param start
/// @param final
/// @param div

function lerp_direction(start, final, vel) {
    var _max, _da, _result;
    _max = 360;
    _da = (final - start) % _max;
    _result = 2 * _da % _max - _da;

    return start + _result * vel;
}
#endregion

#region Create Menu

function create_menu(_type){
	var _menu = noone
	switch(_type){
		case "recipe": _menu = obj_recipe_menu; break
		case "forno": _menu = obj_forno_menu; break
		case "pote": _menu = obj_pote_menu; break
		case "tabua": _menu = obj_tabua_menu; break
		case "box": _menu = obj_caixa_menu; break
		case "pause": _menu = obj_pause_menu; break
	}
	
	instance_create_depth(20, 20, -9000, _menu)
}

#endregion

#region Enter Shooter e Quit Shooter

function enter_shooter(_mode){
	//Entro no modo de tiro e reseto o delay
	switch(_mode){ //Mudando a variável global.shooting
		case "Animais": global.shooting = 1; break;
		case "Plantas": global.shooting = 2; break;
	}
	global.shooting_delay = 10
	
	//Centralizando o mouse e a mira
	display_mouse_set(
	window_get_x() + window_get_width() / 2,
	window_get_y() + window_get_height() / 2)
	
	obj_shooter.mirax = obj_camera.cw_current / 2
	obj_shooter.miray = obj_camera.ch_current / 2
}

function quit_shooter(){
	//Saio do modo de tiro e reseto o delay
	global.shooting = false
	global.shooting_delay = 30
}

#endregion

#region Quicksound

function quicksound(_sound){
	audio_play_sound(_sound, 1, 0)
}

#endregion

#region Funções de inventário

//Função para checar se tem algum item
function check_inventory(){
	var _item_existe = 0
	for(var i = 0; i < ds_list_size(global.inventory); i++){
		for(var j = 0; j < argument_count; j++){
			if(global.inventory[| i].nome == argument[j]){
				_item_existe++
			}
		}
	}
	
	return floor(_item_existe / argument_count)
}

//Função pra checar se o inventário está cheio
function inventory_full(){
	return !(ds_list_size(global.inventory) < global.max_inventory)
}

//Função para adicionar um item ao inventário com base na enum "itens"
function add_item(_index, _amount = 1, _play_sound = true){
	repeat(_amount){
		var _inst = instance_create_layer(obj_chefinho.x, obj_chefinho.y, "itens", obj_item)
		_inst.index = _index
		_inst.play_sound = _play_sound
	}
}

//Função para remover itens do inventário pelo nome (remove o primeiro de cima para baixo)
function remove_item(){
	for(var i = ds_list_size(global.inventory) - 1; i > -1; i--){
		for(var j = 0; j < argument_count; j++){
			if(global.inventory[| i].nome == argument[j]){
				instance_destroy(global.inventory[| i])
				ds_list_delete(global.inventory, i)
				return
			}
		}
	}
}

//Função pra limpar o inventário
function clear_inventory(){
	for(var i = ds_list_size(global.inventory) - 1; i > -1; i--){
		remove_item(global.inventory[| i].nome)
	}
}

//Função que faz uma receita de uma vez só
function do_recipe(){
	//Definindo minhas variáveis
	var _arg_off = (asset_get_type(argument[argument_count - 1]) == asset_sound) + 1
	var _checked = 0
	var _ingred_count = argument_count - _arg_off
	var _result = _ingred_count
	
	var _sound = -1
	if(_arg_off = 2) var _sound = argument[argument_count - 1]
	
	//Primeiro, faço a checagem dos ingredientes.
	for(var i = 0; i < _ingred_count; i++){
		if(check_inventory(argument[i])) _checked++
	}
	
	//Depois, verifico se todos estão presentes
	if(floor(_checked / _ingred_count == true)){
		//Removo os itens necessários
		for(var i = 0; i < _ingred_count; i++){
			remove_item(argument[i])
		}
		
		//Adiciono o resultado
		add_item(argument[_result], 1, 0)
		
		//E por último, toco o som
		if(_sound != -1) quicksound(_sound)
	}
}

#endregion

#region Reset Game

function reset_game(){
	global.paused = false
	global.balas = 10
	global.shooting = false
	clear_inventory()
	audio_stop_all()
	room_goto(rm_start)
}

#endregion