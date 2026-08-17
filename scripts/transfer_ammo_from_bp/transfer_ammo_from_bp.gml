function transfer_ammo_from_bp(){
    var rev_ammo_to_transfer = (obj_weapon.rev_max_total_bullets - obj_weapon.rev_total_bullets) + (obj_weapon.rev_max_bullets - obj_weapon.rev_bullets_left);
    var sho_ammo_to_transfer = (obj_weapon.sho_max_total_bullets - obj_weapon.sho_total_bullets_left) + (obj_weapon.sho_max_bullets - obj_weapon.sho_bullets_left);
    var rif_ammo_to_transfer = (obj_weapon.rif_max_total_mags - obj_weapon.rif_total_mags);
    
    if obj_weapon.rif_bullets_left <= 0 rif_ammo_to_transfer += 1;
    
    if rev_ammo_to_transfer > obj_backpack.rev_ammo rev_ammo_to_transfer = obj_backpack.rev_ammo;
    
    if sho_ammo_to_transfer > obj_backpack.sho_ammo sho_ammo_to_transfer = obj_backpack.sho_ammo;
    
    if rif_ammo_to_transfer > obj_backpack.rif_ammo rif_ammo_to_transfer = obj_backpack.rif_ammo;
    
    obj_weapon.rev_total_bullets += rev_ammo_to_transfer;
    obj_weapon.sho_total_bullets_left += sho_ammo_to_transfer;
    obj_weapon.rif_total_mags += rif_ammo_to_transfer;
    
    obj_backpack.rev_ammo -= rev_ammo_to_transfer;
    obj_backpack.sho_ammo -= sho_ammo_to_transfer;
    obj_backpack.rif_ammo -= rif_ammo_to_transfer;
    
    audio_play_sound(resupply, 0, false);
}