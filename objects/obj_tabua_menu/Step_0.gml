//Herdando as informações
event_inherited()
if(!usable) exit //Saindo do step caso eu não consiga usar o menu

if(confirm or (confirm_2 and hovering)){

	switch(pos){
		case 0: //Chocolate
		do_recipe("Cacau", itens.chocolate, snd_poof)
		break
		
		case 1: //Massa
		do_recipe("Farinha", "Ovo", itens.massa, snd_poof)
		break
		
		case 2: //Nescau
		do_recipe("Leite", "Chocolate", itens.nescau, snd_liquido)
		break
		
		case 3: //Hambúrguer
		do_recipe("Pao", "Tomate", "Queijo", "Carne Assada", itens.burguer, snd_poof)
		break
		
		case 4: //Sair
		instance_destroy()
		break
	}

}

