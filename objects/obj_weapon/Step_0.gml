if global.player_alive = false exit;
    
if obj_player.can_move = false exit;

zone_size = point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) * 0.1;

gun_start_x = obj_player.x + gun_x_distance_from_player;
gun_start_y = obj_player.y + gun_y_distance_from_player;

if ham_charge = ham_max_charge and ham_can_play_max_charge_sound = true{
    audio_play_sound(ham_max, 0, false);
    ham_can_play_max_charge_sound = false;
}

if sho_shoot_delay > 0 sho_shoot_delay -= 1;
    
if keyboard_check_pressed(ord("1")){
    if weapon_type = 4{
        weapon_type = 0;
        audio_play_sound(holster, 0, false);
    }
    else{
        weapon_type = 4;
        audio_play_sound(ham_draw, 0, false);
    }
}

if keyboard_check_pressed(ord("2")) and rev_unlocked = true{
    if weapon_type = 1{
        weapon_type = 0;
        audio_play_sound(holster, 0, false);
    }
    else{
        weapon_type = 1;
        audio_play_sound(revolverdraw, 0, false);
    }
}

if keyboard_check_pressed(ord("3")) and sho_unlocked = true{
    if weapon_type = 2{
        weapon_type = 0;
        audio_play_sound(holster, 0, false);
    }
    else{
        weapon_type = 2;
        audio_play_sound(sho_draw, 0, false);
    }
}

if keyboard_check_pressed(ord("4")) and rif_unlocked = true{
    if weapon_type = 3{
        weapon_type = 0;
        audio_play_sound(holster, 0, false);
    }
    else{
        weapon_type = 3;
        audio_play_sound(rifledraw, 0, false);
    }
}

if keyboard_check_pressed(ord("T")) and weapon_type = 3 and rif_reloading = false{
    audio_play_sound(modeswitch1, 0, false);
    if fire_mode = 0 fire_mode = 1;
        else fire_mode = 0;
}
    
if rev_bullets_left <= 0 or rev_reloading = true rev_can_shoot = false;
    else rev_can_shoot = true;
        
if sho_bullets_left <= 0 or sho_reloading = true or sho_shoot_delay > 0 sho_can_shoot = false;
    else sho_can_shoot = true;
    
if rif_bullets_left <= 0 or rif_reloading = true rif_can_shoot = false;
    else rif_can_shoot = true;
    


if keyboard_check_pressed(ord("R")){
    if weapon_type = 0 or weapon_type = 4 exit;
        
    if weapon_type = 1 and rev_bullets_left < rev_max_bullets and rev_reloading = false and rev_total_bullets > 0{
        audio_play_sound(rev_reload_start, 0, false)
        rev_reloading = true;
    }
    if weapon_type = 2 and sho_shoot_delay <= 0 and sho_bullets_left < sho_max_bullets and sho_reloading = false and sho_total_bullets_left > 0{
        sho_reloading = true;
        audio_play_sound(sho_reload_start, 0, false)
    }
    if weapon_type = 3 and rif_bullets_left < rif_max_bullets and rif_reloading = false and rif_total_mags > 0{
        rif_reloading = true;
        audio_play_sound(rif_reload1, 0, false);
    }
}

if rev_reloading = true{
    if mouse_check_button_pressed(mb_left){
        rev_reloading = false;
        audio_play_sound(rev_reload_end, 0, false);
    }
    if weapon_type != 1{
        rev_reloading = false;
    }
    if rev_total_bullets <= 0{
        rev_reloading = false;
    }
    rev_reload_time_left -= 1;
    if rev_reload_time_left <= 0{
        if rev_bullets_left = rev_max_bullets{
            rev_reload_delay_left = 2;
        }
        if rev_reload_delay_left = 1{
            rev_bullets_left += 1;
            rev_total_bullets -= 1;
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

if sho_reloading = true{
    if mouse_check_button_pressed(mb_left){
        sho_reloading = false;
        audio_play_sound(sho_reload_end, 0, false);
    }
    if weapon_type != 2{
        sho_reloading = false;
    }
    if sho_total_bullets_left <= 0{
        sho_reloading = false;
    }
    sho_reload_time_left -= 1;
    if sho_reload_time_left <= 0{
        if sho_bullets_left = sho_max_bullets{
            sho_reload_delay_left = 2;
        }
        if sho_reload_delay_left = 1{
            sho_bullets_left += 1;
            sho_total_bullets_left -= 1;
            audio_play_sound(sho_shell_insert, 0, false);
        }
        if sho_reload_delay_left = 0{
            sho_reload_delay_left = 1;
        }
        sho_reload_time_left = sho_max_reload_time;
    }
    if sho_reload_delay_left = 2{
        sho_reload_delay_left = 0;
        audio_play_sound(sho_reload_end, 0, false);
        sho_reloading = false;
    }
}

if rif_reloading = true{
    if weapon_type != 3{
        rif_reloading = false;
        rif_reload_time_left = rif_max_reload_time;
        audio_stop_sound(rif_reload1);
    }
    if rif_reload_time_left <= 0{
        rif_total_mags -= 1;
        rif_bullets_left = rif_max_bullets;
        rif_reloading = false;
        rif_reload_time_left = rif_max_reload_time;
    }
    rif_reload_time_left -= 1;
}