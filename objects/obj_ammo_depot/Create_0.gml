rev_ammo = 99999;
sho_ammo = 99999;
rif_ammo = 99999;

add_rev = 0;
add_sho = 0;
add_rif = 0;

mode = "give"; //take or give

gui_x = 200;
gui_y = 200;

draw_gui = false;
draw_outline = false;

transfer_to_pocket = function() {
    audio_play_sound(resupply, 0, false);
    if rev_ammo > 0 and obj_weapon.rev_total_bullets < obj_weapon.rev_max_total_bullets or obj_weapon.rev_bullets_left < obj_weapon.rev_max_bullets{
        var rev_total_bullets_to_add = obj_weapon.rev_max_total_bullets - obj_weapon.rev_total_bullets;
        var rev_bullets_to_add = obj_weapon.rev_max_bullets - obj_weapon.rev_bullets_left;
        
        obj_weapon.rev_total_bullets += rev_total_bullets_to_add + rev_bullets_to_add;
        rev_ammo -= rev_total_bullets_to_add + rev_bullets_to_add;
    }
    if sho_ammo > 0 and obj_weapon.sho_total_bullets_left < obj_weapon.sho_max_total_bullets or obj_weapon.sho_bullets_left < obj_weapon.sho_max_bullets{
        var sho_total_bullets_to_add = obj_weapon.sho_max_total_bullets - obj_weapon.sho_total_bullets_left;
        var sho_bullets_to_add = obj_weapon.sho_max_bullets - obj_weapon.sho_bullets_left;
        
        obj_weapon.sho_total_bullets_left += sho_total_bullets_to_add + sho_bullets_to_add;
        sho_ammo -= sho_total_bullets_to_add + sho_bullets_to_add;
    }
    if rif_ammo > 0 and obj_weapon.rif_total_mags < obj_weapon.rif_max_total_mags or obj_weapon.rif_bullets_left < obj_weapon.rif_max_bullets{
        var rif_total_mags_to_add = obj_weapon.rif_max_total_mags - obj_weapon.rif_total_mags;
        
        obj_weapon.rif_total_mags += rif_total_mags_to_add;
        rif_ammo -= rif_total_mags_to_add;
        if obj_weapon.rif_bullets_left <= 0{
            obj_weapon.rif_bullets_left = obj_weapon.rif_max_bullets;
            rif_ammo -= 1;
        }
    }
}

drop_rapid_delay_max = 15;
drop_rapid_delay = drop_rapid_delay_max;
time_between_rapid_drops_max = 3;
time_between_rapid_drops = time_between_rapid_drops_max;

la_peace = function(add, reserve) {
    if (!mouse_check_button(mb_left) and !mouse_check_button(mb_right)) {
        drop_rapid_delay = drop_rapid_delay_max;
    }
    
    if mouse_check_button_pressed(mb_left){
        if (add < reserve) {
            add += 1;
            audio_play_sound(item_subtract, 0, false);
        }
    }
    
    if mouse_check_button_pressed(mb_middle){
        if (add < reserve) {
            add = reserve;
            audio_play_sound(item_subtract, 0, false);
        } else {
            add = 0;
            audio_play_sound(item_add_back, 0, false);
        }
    }
    if mouse_check_button(mb_left){
        if drop_rapid_delay > 0 drop_rapid_delay -= 1;
        
        if drop_rapid_delay <= 0{
            time_between_rapid_drops -= 1;
            if time_between_rapid_drops <= 0{
                time_between_rapid_drops = time_between_rapid_drops_max;
                if (add < reserve) {
                    add += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
        }
    }
    if mouse_check_button_pressed(mb_right){
        if (add > 0) {
            add -= 1;
            audio_play_sound(item_add_back, 0, false);
        }
    }
    if mouse_check_button(mb_right){
        if drop_rapid_delay > 0 drop_rapid_delay -= 1;
        
        if drop_rapid_delay <= 0{
            time_between_rapid_drops -= 1;
            if time_between_rapid_drops <= 0{
                time_between_rapid_drops = time_between_rapid_drops_max;
                if (add > 0) {
                    add -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
        }
    }
    return add;
}