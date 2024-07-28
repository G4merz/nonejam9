//Estados da câmera
enum camera_states{
	follow_object,
	follow_point
}

camera_state = camera_states.follow_object

//Variável que define que objeto vou seguir
seguindo = noone

/*Com essa variável posso "destravar" o zoom da câmera e colocar no que eu quiser,
desde que este valor esteja no limite*/
free_zoom = false

//Largura e altura base da câmera (escala sempre tem que ser 1 ou menos)
cam_scale = 1
width = 1
height = 1

//Habilitando a câmera
view_camera[0] = true

//Mudando o tamanho da câmera
camera_set_view_size(view_camera[0], width, height)

//Posição da Câmera
cx = camera_get_view_x(view_camera[0])
cy = camera_get_view_y(view_camera[0])

//Limite da câmera
cx_limit = room_width
cy_limit = room_height

//Destino da câmera
destino_x = 0
destino_y = 0

//Velocidade da câmera
cam_spd = 0.2

//Tamanho da câmera
c_size = 1
c_size_min = .75
c_size_max = 1.25
c_size_previous = 1

//Limite pro tamanho da application surface
surf_resize_limit = 3

//Salvando o aspect ratio pra caso ele mude, eu alterar o tamanho
aspect_ratio = obj_display_manager.aspect_ratio
aspect_ratio_previous = aspect_ratio

//Tamanhos Padrão
c_size_default = 1
c_size_player = 1

//Largura e Altura
cw_current = width * c_size
ch_current = height * c_size

//Para iniciar a câmera direto no jogador
init = false

mover = function(){
	//Se o objeto que estou seguindo existir, rodo o código abaixo
	if(instance_exists(seguindo)){
		//Se não iniciei ainda...
		//Se não iniciei ainda...
		if(!init){
			//Coloco a câmera em uma posição que mantém o objeto no centro
			destino_x = seguindo.x - cw_current / 2
			destino_y = seguindo.y - ch_current / 2
			cx = destino_x
			cy = destino_y
			camera_set_view_pos(view_camera[0], cx, cy)
			
			init = true
		}
		
		//Mudando o destino se o estado da câmera for "seguir"
		if(camera_state = camera_states.follow_object){
		
			//Checando o que eu estou seguindo no switch para mudar o tamanho de acordo
				if(!free_zoom){
				switch(seguindo){
					case obj_chefinho:
						c_size = c_size_player
						break
					default:
						c_size = c_size_default
						break
				}
			}
			
			destino_x = seguindo.x
			destino_y = seguindo.y
			
		}else{	//Se o estado não for de seguir objetos, mudo o tamanho da câmera para o padrão
			c_size = c_size_default
		}
		
		//Lerpando a minha posição para o objeto que estou seguindo ficar no centro
		cx = lerp(cx, destino_x - cw_current / 2, cam_spd)
		cy = lerp(cy, destino_y - ch_current / 2, cam_spd)
		
		//Não deixar a câmera sair da room
		cx = clamp(cx, 0, cx_limit - cw_current)
		cy = clamp(cy, 0, cy_limit - ch_current)
		
		//Coloco a minha câmera definitiva em posição
		camera_set_view_pos(view_camera[0], cx, cy)
	}
}
	
resize = function(){
	//Limitando meu zoom
	c_size = clamp(c_size, c_size_min, c_size_max)
	
	if(!free_zoom){
		if(seguindo = obj_chefinho) c_size = c_size_player
		else c_size = c_size_default
	}
	
	//Se o tamanho da câmera mudou, eu rodo o código a seguir
	if(c_size != c_size_previous or aspect_ratio != aspect_ratio_previous
	or cw_current != width or ch_current != height){
		cx += cw_current / 2
		cy += ch_current / 2
		
		cw_current = width * c_size
		ch_current = height * c_size
		
		cx -= cw_current / 2
		cy -= ch_current / 2
		
		camera_set_view_pos(view_camera[0], cx, cy)
		camera_set_view_size(view_camera[0], cw_current, ch_current)
		
		//Mudando o tamanho da surface pra evitar distorção de pixels
		var ws = obj_display_manager.window_size
		surface_resize(application_surface, 
		min(cw_current * ws, cw_current * surf_resize_limit * ws), 
		min(ch_current * ws, ch_current * surf_resize_limit * ws))

	}
	
	c_size_previous = c_size
	aspect_ratio_previous = aspect_ratio
}