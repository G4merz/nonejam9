var w = camera_get_view_width(view_camera[0])
var h = camera_get_view_height(view_camera[0])

var w2 = view_wport[0]
var h2 = view_hport[0]

draw_text(10, 10, string(w) + " / " + string(h))
draw_text(10, 30, string(w2) + " / " + string(h2))