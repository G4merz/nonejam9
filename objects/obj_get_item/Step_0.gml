image_alpha = approach(image_alpha, 0, dec)
dec *= 1.1

vspeed = approach(vspeed, 0, 0.04)
if(image_alpha <= 0) instance_destroy()