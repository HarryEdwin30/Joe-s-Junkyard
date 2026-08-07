if global.player_alive = false exit;
    
if global.being_attacked = true exit;

if global.bullets_left >= bullets and global.reloading = false{
    audio_play_sound(emptygun, 0, false)
}

if gun_type != 3 exit;
    
