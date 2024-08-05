depth = -8000
fade_spd = 1000

if(global.dificuldade < 3){
	shooter_music = [msc_caca_facil, msc_caca_normal, msc_caca_dificil]
	shooter_volume = 0
	prev_shooter_volume = shooter_volume

	kitchen_music = msc_cozinha_1
	kitchen_volume = 1
	prev_kitchen_volume = kitchen_volume

	audio_play_sound(shooter_music[global.dificuldade], 2, 1)
	audio_sound_gain(shooter_music[global.dificuldade], shooter_volume, 0)
	audio_play_sound(kitchen_music, 2, 1)
}else{
	shooter_music = msc_caca_masterchef
	audio_play_sound(shooter_music, 2, 1)
}

max_tempo = seconds(241)
tempo = max_tempo
alpha = 0

#region Partículas
partsys = part_system_create();
part_system_depth(partsys, -2500)
cor = make_color_rgb(199,220, 208);
cor2 = make_color_rgb(155,171,178);

partype = part_type_create();

part_type_shape(partype, pt_shape_disk);
part_type_life(partype, 15, 30);
part_type_size(partype, .5, 1, -.02, .5);
part_type_color2(partype, cor, cor2);
part_type_alpha2(partype, 1, 0);

part_type_direction(partype, 0, 360, 1, 0);
part_type_speed(partype, 1, 2, -.02, .5);
part_type_gravity(partype, .5, 90);


///////////////////////
partype2 = part_type_create();

part_type_shape(partype2, pt_shape_circle);
part_type_life(partype2, 20, 30);
part_type_size(partype2, .1, .4, -.02, .5);
part_type_color1(partype2, cor2);
part_type_alpha2(partype2, 1, 0);

part_type_direction(partype2, 0, 360, 1, .5);
part_type_speed(partype2, 1, 2, -.02, .5);
part_type_gravity(partype2, 1, 90);
#endregion

//Criando a sequencia
sequence = layer_sequence_create("transicao", 0, 0, sq_transicao)
layer_sequence_headpos(sequence, 60)