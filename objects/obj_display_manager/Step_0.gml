res_array = [1, 4/3, 16/9]
cur_res = 0
if(keyboard_check_pressed(vk_space)){
	cur_res++; if(cur_res > 2) cur_res = 0
	change_resolution(res_array[cur_res], 480)
}