function getoffme(countdown_to_push, push_button){
    
    if keyboard_check_pressed(push_button) and global.push_cooldown <= 0{
        global.push_cooldown = global.push_cooldown_max;
        obj_player.m_spd = obj_player.def_m_spd;
        global.being_attacked = false;
        audio_play_sound(bulletinsert, 0, false);
        obj_zombie_parent.stunned = 75;
    }
}