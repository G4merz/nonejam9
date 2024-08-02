shooter_volume = global.shooting
if(prev_shooter_volume != shooter_volume) audio_sound_gain(shooter_music[global.dificuldade], shooter_volume, fade_spd * 2)
prev_shooter_volume = shooter_volume

kitchen_volume = !global.shooting
if(prev_kitchen_volume != kitchen_volume) audio_sound_gain(msc_cozinha, kitchen_volume, fade_spd)
prev_kitchen_volume = kitchen_volume

layer_depth("paredes_1", obj_chefinho.depth - 1)
layer_depth("paredes_2", 200)