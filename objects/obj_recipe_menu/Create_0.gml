/*
width = 0
height = 0

borda = 10 //Distância da borda da caixa
espaco = 18 //Distância entre opções
*/

pos = 0 

#region Opções
option =	[
			"Chocolate",
			"Queijo", 
			"Farinha",
			"Manteiga",
			"Molho",
			"Carne Assada", 
			"Massa",
			"Pão",
			"Achocolatado", 
			"Bolo", 
			"Bolo de Chocolate", 
			"Pizza", 
			"Macarrão",  
			"Hambúrguer"
			]
#endregion

#region Descrições	
/*
description =	[
			"Cacau com açúcar. Esquente [c_green]Cacau[/c].",
			"Leite coagulado. Esquente [c_red]Leite[/c].",
			"Trigo moído. Bata [c_green]Trigo[/c].",
			"Gordura do leite cremosa. Bata [c_red]Leite[/c].",
			"Massa assada. Esquente [c_yellow]Massa[/c].",
			"Pasta feita de tomates. Bata [c_green]Tomate[/c].",
			"Carne... assada. Esquente [c_red]Carne Crua[/c].",
			"Mistura de farinha e água, com outros ingredientes dependendo do uso. Bata [c_yellow]Farinha[/c] e [c_red]Ovo[/c].",
			"Leite com chocolate (não podemos colocar o nome da [c_red][shake]marca certa[/c][/shake] por motivos de direitos autorais). Bata [c_red]Leite[/c] e [c_aqua]Chocolate[/c].",
			"Doce altamente personalizável feito primariamente com massa e açúcar. Esquente [c_yellow]Massa[/c], [c_yellow]Manteiga[/c] e [c_red]Leite[/c].",
			"A mesma coisa do de cima, mas melhor. Esquente [c_yellow]Massa[/c], [c_yellow]Manteiga[/c], [c_red]Leite[/c] e [c_aqua]Chocolate[/c].",
			"Massa assada com molho, queijo e outros ingredientes. Esquente [c_yellow]Massa[/c], [c_yellow]Molho[/c], [c_yellow]Queijo[/c] e [c_aqua]Carne Assada[/c].",
			"Massa longa e tubular, geralmente servida com molho. Esquente [c_yellow]Massa[/c] e [c_yellow]Molho[/c].",
			"Um sábio uma vez disse: "Dois hambúrgueres, alface, queijo, molho especial, cebola e picles num pão com gergelim." Junte [c_yellow]Pão[/c], [c_yellow]Queijo[/c], [c_yellow]Carne Assada[/c] e [c_green]Tomate[/c] na tábua de cortar.",
			"Sair do menu.",
			]
	*/
#endregion
			
option_length = array_length(option)

global.paused = true

//Escalas das opções
scale_esq = 1
scale_dir = 1
scale_x = 1

//Adicionando um delay pra abrir o menu, assim quando o player for fazer queijo o menu ainda abre.
usable = false
alarm[0] = 3