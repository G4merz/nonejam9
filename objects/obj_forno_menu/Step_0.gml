//Herdando as informações
event_inherited()
if(!usable) exit //Saindo do step caso eu não consiga usar o menu

if(confirm){

	switch(pos){
		case 0: //Pão
		do_recipe("Massa", itens.pao)
		break	
		
		case 1: //Queijo
		do_recipe("Leite", itens.queijo, snd_borbulha)
		break
		
		case 2: //Carne Assada
		do_recipe("Carne Crua", itens.carne_assada, snd_assa)
		break
		
		case 3: //Bolo
		do_recipe("Massa", "Manteiga", "Leite", itens.bolo, snd_forno_pronto)
		break
		
		case 4: //Bolo de Chocolate
		do_recipe("Massa", "Manteiga", "Leite", "Chocolate", itens.bolo_chocolate, snd_forno_pronto)
		break
		
		case 5: //Pizza
		do_recipe("Massa", "Molho", "Carne Assada", "Queijo", itens.pizza, snd_forno_pronto)
		break
		
		case 6: //Macarrão
		do_recipe("Massa", "Molho", itens.macarrao, snd_borbulha)
		break
		
		case 7: //Sair
		instance_destroy()
		break
	}

}

