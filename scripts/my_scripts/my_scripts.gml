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
/// @param {real} _chance	Chance em porcentagem (de 0 a 1)

/*Essa função gera um número aleatório entre 0 e 1, e retorna se aquele número é menor
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
	return _sec * global.target_fps	
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