function deal_damage(damage_to_deal, sound_to_play, deal_damage_to, sound_x, sound_y, sound_z){
    deal_damage_to.hp -= damage_to_deal;
    
    if sound_x != undefined and sound_y != undefined and sound_z != undefined{
        audio_play_sound_at(sound_to_play, sound_x, sound_y, 0, 160, 320, 1, false, 0);
    }
    else if sound_to_play = undefined or obj_weapon.weapon_type = 2 exit;
        else audio_play_sound(sound_to_play, 0, false);
}