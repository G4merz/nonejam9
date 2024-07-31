//Saindo do step se o jogo estiver pausado
if(global.paused or global.shooting) exit

//Executando meu estado
estado()

//Herdando o evento pai
event_inherited()