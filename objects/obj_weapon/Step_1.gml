if (global.save_game) {
	data.weapon_type = weapon_type;
    
    data.rev_unlocked = rev_unlocked;
    data.sho_unlocked = sho_unlocked;
    data.rif_unlocked = rif_unlocked;
    
    data.rev_total_bullets = rev_total_bullets
    data.rev_bullets_left = rev_bullets_left;
    
    data.sho_total_bullets_left = sho_total_bullets_left;
    data.sho_bullets_left = sho_bullets_left;
    
    data.fire_mode = fire_mode;
    data.rif_total_mags = rif_total_mags;
    data.rif_bullets_left = rif_bullets_left;
    
    global.data[$ key] = data;
}