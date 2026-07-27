if keyboard_check_pressed(vk_escape) game_end();
    
fullscreen_delay -= 1;
    
if keyboard_check_pressed(vk_f4) and can_set_fullscreen = true and fullscreen_delay <= 0{
    fullscreen_delay = max_fullscreen_delay;
    can_set_fullscreen = false;
    window_set_fullscreen(true);
}
    
if keyboard_check_pressed(vk_f4) and can_set_fullscreen = false and fullscreen_delay <= 0{
    fullscreen_delay = max_fullscreen_delay;
    can_set_fullscreen = true;
    window_set_fullscreen(false);
}
    
show_debug_message("nigga cooldown = " + string(global.push_cooldown));

global.infected = instance_number(obj_zombie_parent);

if !instance_exists(obj_player) and global.player_alive = true{
    show_debug_message("You are dead nigga!");
    global.player_alive = false;
}