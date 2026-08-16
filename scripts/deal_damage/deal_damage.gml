function deal_damage(damage_to_deal, sound_to_play, deal_damage_to){
    deal_damage_to.hp -= damage_to_deal;
    
    if sound_to_play = undefined or obj_weapon.weapon_type = 2 exit;
        else audio_play_sound(sound_to_play, 0, false);
}