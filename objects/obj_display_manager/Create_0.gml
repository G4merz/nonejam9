//Resulução DO JOGO
/*A largura ideal é colocada em 0 por hora. Faço isso porque, para remover as
barras pretas dos lados quando a janela for esticada, minha largura vai mudar,
então não posso defini-la ainda.*/
ideal_width = 0
ideal_height = 480

//Tamanho da janela
window_size = 1
max_window_size = 1

//Aspect Ratio
//aspect_ratio = display_get_width() / display_get_height()
aspect_ratio = 1 / 1

//Com o Aspect Ratio calculado, eu consigo definir minha largura ideal
ideal_width = round(ideal_height * aspect_ratio)

//Agora eu verifico se a largura ideal é um número ímpar, e se for, eu mudo isso.
if((ideal_width % 2) == 1) ideal_width++	

#region Pixel Perfect Scaling
pixel_perfect = false

/*Cálculo para remover distorção de pixels em resoluções com aspect ratio
diferentes (não sei como a conta funciona, mas tá lá no canal do PixelatedPope)
RECOMENDADO PARA RESOLUÇÕES BAIXAS*/
if(pixel_perfect){
	if(display_get_width() mod ideal_width != 0){
		var _d = round(display_get_width() / ideal_width)
		ideal_width = display_get_width() / _d
	}

	if(display_get_height() mod ideal_height != 0){
		var _d = round(display_get_height() / ideal_height)
		ideal_height = display_get_height() / _d
	}

	if((ideal_width % 2) == 1) ideal_width++
	if((ideal_height % 2) == 1) ideal_height++
}
#endregion

//Calculando o valor máximo que minha janela pode ter
max_window_size = floor(display_get_width() / ideal_width)

/*Depois de ter as resoluções, eu vou mudar a largura e altura de todos os viewports
no meu jogo. Começo o i em 1, já que não preciso alterar os valores da room de init*/
for(var i = 1; i <= room_last; i++){
	if(room_exists(i)){
		room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height)
		room_set_view_enabled(i, true)
	}
}

//Agora eu defino os tamanhos da minha application_surface e da janela do jogo.
surface_resize(application_surface, ideal_width, ideal_height)
window_set_size(ideal_width * window_size, ideal_height * window_size)
alarm[0] = 1 //Fazendo o window_center() 1 frame depois, assim ele funciona

//E agora vou pra room inicial
room_goto(rm_testes)

//Função pra mudar o aspect ratio
change_resolution = function(_aspect_ratio, _height){
	//Mudo meus valores pro desejado
	aspect_ratio = _aspect_ratio
	ideal_height = _height
	
	//Recalculo a largura do jogo e coloco em número par se necessário
	ideal_width = round(ideal_height * aspect_ratio)
	if((ideal_width % 2) == 1) ideal_width++	
	
	//Agora eu defino os tamanhos da minha application_surface, da câmera e da janela do jogo.
	surface_resize(application_surface, ideal_width, ideal_height)
	window_set_size(ideal_width * window_size, ideal_height * window_size)
	alarm[0] = 1
}