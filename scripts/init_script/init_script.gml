//Macros
#macro FPS game_get_speed(gamespeed_fps)

//Definindo uma variável para se referir ao objeto do player
global.player_object = obj_chefinho

//Variável que guarda minhas balas
global.balas = 5

//Variável que definem se o jogo está pausado ou não
global.paused = false

//Variável que define se estou em algum estande ou não
global.shooting = false
global.shooting_delay = 0 //Delay pra alternar entre os segmentos do jogo

//Randomizando
randomize()