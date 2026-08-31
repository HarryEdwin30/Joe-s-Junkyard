global.player_alive = true;
global.survivors_left = instance_number(obj_human_parent);
global.being_attacked = false;
global.push_cooldown_max = 300;
global.push_cooldown = 0;
global.zoomed_in = false;

if file_exists("gamesave.ini"){
    ini_open("gamesave.ini")
    obj_player.x = ini_read_real("Player", "X", 0);
    obj_player.y = ini_read_real("Player", "Y", 0);
    ini_close();
}
show_dev_stats = true;