if global.player_alive = false exit;
    
if rev_bullets_left <= 0 or rev_reloading = true rev_can_shoot = false;
    else rev_can_shoot = true;
    
if keyboard_check_pressed(ord("R")){
    if weapon_type = 0 or weapon_type = 4 exit;
        
    if weapon_type = 1 and rev_bullets_left < rev_max_bullets and rev_reloading = false{
        audio_play_sound(rev_reload_start, 0, false)
        rev_reloading = true;
    }
}

if rev_reloading = true{
    rev_reload_time_left -= 1;
    if rev_reload_time_left <= 0{
        if rev_bullets_left = rev_max_bullets{
            rev_reload_delay_left = 2;
        }
        if rev_reload_delay_left = 1{
            rev_bullets_left += 1;
            audio_play_sound(bulletinsert, 0, false);
        }
        if rev_reload_delay_left = 0{
            rev_reload_delay_left = 1;
        }
        rev_reload_time_left = rev_max_reload_time;
    }
    if rev_reload_delay_left = 2{
        rev_reload_delay_left = 0;
        audio_play_sound(rev_reload_end, 0, false);
        rev_reloading = false;
    }
}