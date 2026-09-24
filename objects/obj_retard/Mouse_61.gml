if global.player_alive = false exit;
    
if obj_player.can_move = false exit;
    
global.zoomed_in = false;

var cam = view_camera[0];
camera_set_view_size(cam, 640, 480);
surface_resize(application_surface, camera_get_view_width(cam), camera_get_view_height(cam));