var cam = view_camera[0];

var camx = camera_get_view_x(cam);
var camy = camera_get_view_y(cam);

if run_fade = true{
    draw_sprite_ext(spr_fade, -1, camx, camy, 1, 1, 0, c_white, death_i_alpha)
}