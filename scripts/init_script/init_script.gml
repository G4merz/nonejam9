//Macros
#macro FPS game_get_speed(gamespeed_fps)

//Definindo uma variável para se referir ao objeto do player
global.player_object = obj_chefinho

//Variável que guarda minhas balas
global.balas = 10

//Variável da dificuldade (0-3)
global.dificuldade = 1

//DS List do inventário
global.inventory = ds_list_create()
global.max_inventory = 6

//Variável que definem se o jogo está pausado ou não
global.paused = false
global.pause_delay = 10

//Variável que define se estou em algum estande ou não
global.shooting = false
global.shooting_delay = 0 //Delay pra alternar entre os segmentos do jogo

//Randomizando
randomize()