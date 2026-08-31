function move_to_menu (){
    if global.player_alive = true{
        instance_destroy(obj_player)
    }
    else exit;
    var cam = view_camera[0];
    camera_set_view_size(cam, 640, 480);
    surface_resize(application_surface, camera_get_view_width(cam), camera_get_view_height(cam));
    instance_destroy(obj_pathfinding);
    instance_destroy(obj_retard);
    instance_destroy(obj_weapon);
    room_goto(MainMenu);
}