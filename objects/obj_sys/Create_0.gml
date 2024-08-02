depth = -8000
fade_spd = 1000

shooter_music = [msc_caca_facil, msc_caca_normal, msc_caca_dificil, msc_caca_masterchef]
shooter_volume = 0
prev_shooter_volume = shooter_volume

kitchen_music = msc_cozinha
kitchen_volume = 1
prev_kitchen_volume = kitchen_volume

audio_play_sound(shooter_music[global.dificuldade], 2, 1)
audio_sound_gain(shooter_music[global.dificuldade], shooter_volume, 0)
audio_play_sound(kitchen_music, 2, 1)