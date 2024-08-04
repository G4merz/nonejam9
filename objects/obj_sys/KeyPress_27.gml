if(!global.shooting and global.pause_delay = 0 and tempo > 0
and (!instance_exists(obj_cook_menu) and !instance_exists(obj_recipe_menu) and !instance_exists(obj_caixa_menu))){
	global.paused = true
	global.pause_delay = 10
	create_menu("pause")
}