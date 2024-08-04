image_index = index
if(estado != item_states.stored){
	draw_set_color(c_white)
	//draw_text(x + 12, y - 20, nome)
	draw_set_color(-1)

	draw_sprite_ext(spr_ingredientes, image_index, xx, yy, 1, 1, image_angle, c_white, 1)
}