global.player_alive = true;
global.survivors_left = instance_number(obj_human_parent);
global.being_attacked = false;
global.zombies_attacking = 0;
global.push_cooldown_max = 300;
global.push_cooldown = 0;

if file_exists("gamesave.ini"){
    ini_open("gamesave.ini")
    obj_player.x = ini_read_real("Player", "X", 0);
    obj_player.y = ini_read_real("Player", "Y", 0);
    ini_close();
}

var cam = view_camera[0];
surface_resize(application_surface, camera_get_view_width(cam), camera_get_view_height(cam));