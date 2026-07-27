if keyboard_check_pressed(vk_escape) game_end();

global.infected = instance_number(obj_zombie_parent);

if !instance_exists(obj_player) and global.player_alive = true{
    show_debug_message("You are dead nigga!");
    global.player_alive = false;
}