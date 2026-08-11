global.infected = instance_number(obj_zombie_parent);

if !instance_exists(obj_player) and global.player_alive = true{
    global.player_alive = false;
}

var cam = view_camera[0];
surface_resize(application_surface, camera_get_view_width(cam), camera_get_view_height(cam));

if keyboard_check_pressed(ord("Z")){
    instance_create_depth(mouse_x, mouse_y, 0, obj_walker);
}