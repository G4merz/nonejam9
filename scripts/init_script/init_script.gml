//Macros
#macro FPS game_get_speed(gamespeed_fps)

//Definindo uma variável para se referir ao objeto do player
global.player_object = obj_chefinho

//Variável que define se o jogo está pausado ou não
global.paused = false

//Randomizando
randomize()