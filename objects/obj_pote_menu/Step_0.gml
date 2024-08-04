//Herdando as informações
event_inherited()
if(!usable) exit //Saindo do step caso eu não consiga usar o menu

if(confirm or (confirm_2 and hovering)){

	switch(pos){
		case 0: //Farinha
		do_recipe("Trigo", itens.farinha, snd_moer)
		break
		
		case 1: //Manteiga
		do_recipe("Leite", itens.manteiga, snd_poof)
		break
		
		case 2: //Molho
		do_recipe("Tomate", itens.molho_tomate, snd_poof)
		break
		
		case 3: //Sair
		instance_destroy()
		break
	}

}

