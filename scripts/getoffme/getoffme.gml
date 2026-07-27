function getoffme(countdown_to_push, push_button){
    
    if keyboard_check_pressed(push_button){
        obj_player.m_spd = 1;
        global.being_attacked = false;
        audio_play_sound(bulletinsert, 0, false);
        obj_zombie_parent.stunned = 50;
    }
}