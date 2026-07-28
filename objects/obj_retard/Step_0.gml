if keyboard_check_pressed(vk_escape) game_end();
    
if keyboard_check_pressed(ord("5")){
    ini_open("gamesave.ini")
    obj_player.x = ini_read_real("Player", "X", 100);
    obj_player.y = ini_read_real("Player", "Y", 350);
    room_goto(ini_read_real("Player", "Room", TestRoom));
    ini_close();
    show_debug_message("Save file loaded nigga.")
}
    
if keyboard_check_pressed(vk_delete){
    if file_exists("gamesave.ini"){
        file_delete("gamesave.ini");
        show_debug_message("Save file deleted nigga.");
    }
        else show_debug_message("You have no save file to delete nigga.");
}

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
    

global.infected = instance_number(obj_zombie_parent);

if !instance_exists(obj_player) and global.player_alive = true{
    show_debug_message("You are dead nigga!");
    global.player_alive = false;
}