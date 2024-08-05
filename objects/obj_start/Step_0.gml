if(state = "logo"){
	tempo--
	pos += 2
	
	if(fade_intro) intro_alpha = approach(intro_alpha, 1, 0.02)
	else intro_alpha = approach(intro_alpha, 0, 0.02)
	
	if(fade_intro and intro_alpha = 1){
		espera_fade--
		if(espera_fade = 0) fade_intro = false
	}
	
	if(tempo = 0) state = "started"
}

if(state = "started"){
	b_alpha = approach(b_alpha, 0, 0.02)
	if(!instance_exists(obj_main_menu)) instance_create_layer(32, 256, "Instances", obj_main_menu)
}