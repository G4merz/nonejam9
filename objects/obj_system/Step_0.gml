shooter_volume = global.shooting
if(prev_shooter_volume != shooter_volume) audio_sound_gain(msc_shooter_1, shooter_volume, fade_spd)
prev_shooter_volume = shooter_volume