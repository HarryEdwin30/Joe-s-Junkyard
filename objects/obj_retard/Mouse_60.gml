if global.player_alive = false exit;
    
if obj_player.can_move = false exit;
    
global.zoomed_in = true;

var cam = view_camera[0];
camera_set_view_size(cam, 320, 240);
surface_resize(application_surface, camera_get_view_width(cam), camera_get_view_height(cam));