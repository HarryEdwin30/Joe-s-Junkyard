if keyboard_check_pressed(ord("E")){
    audio_play_sound(resupply, 0, false);
    if rev_ammo > 0 and obj_weapon.rev_total_bullets < obj_weapon.rev_max_total_bullets or obj_weapon.rev_bullets_left < obj_weapon.rev_max_bullets{
        var rev_total_bullets_to_add = obj_weapon.rev_max_total_bullets - obj_weapon.rev_total_bullets;
        var rev_bullets_to_add = obj_weapon.rev_max_bullets - obj_weapon.rev_bullets_left;
        
        obj_weapon.rev_total_bullets += rev_total_bullets_to_add;
        obj_weapon.rev_bullets_left += rev_bullets_to_add;
        rev_ammo -= rev_total_bullets_to_add + rev_bullets_to_add;
    }
    if rif_ammo > 0 and obj_weapon.rif_total_mags < obj_weapon.rif_max_total_mags or obj_weapon.rif_bullets_left < obj_weapon.rif_max_bullets{
        var rif_total_mags_to_add = obj_weapon.rif_max_total_mags - obj_weapon.rif_total_mags;
        
        obj_weapon.rif_total_mags += rif_total_mags_to_add;
        rif_ammo -= rif_total_mags_to_add;
    }
}