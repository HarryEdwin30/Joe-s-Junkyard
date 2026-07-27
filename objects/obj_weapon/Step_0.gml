if global.player_alive = false exit;
    
if global.bullets_left >= bullets global.can_shoot = false
    
if global.being_attacked = true exit;
    

if keyboard_check_pressed(ord("R")) and global.reloading = false and global.bullets_left > max_bullets{
    global.reloading = true
    reload_time_left = reload_time * global.bullets_left
    global.bullets_left = bullets;
    audio_play_sound(reloadstart, 0, false)
}
    
if global.reloading = true{
    global.can_shoot = false
    reload_time_left -= 1;
    
    if reload_time_left % reload_time == 0 audio_play_sound(bulletinsert, 0, false);
}

if reload_time_left <= 0{
    global.bullets_left = max_bullets;
    global.can_shoot = true;
    global.reloading = false;
    reload_time_left = reload_time;
    audio_play_sound(reloadend, 0, false)
}