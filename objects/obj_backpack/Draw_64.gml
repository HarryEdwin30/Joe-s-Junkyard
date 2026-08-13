if draw_backpack_ui = true{
    draw_set_font(backpackfont2);
    draw_set_colour(c_red);
    draw_text(160, 150, "Backpack ---");
    draw_text(160, 190, "Beef Stew: " + string(bs) + "/" + string(max_bs));
    draw_text(160, 215, "Scrap: " + string(scrap) + "/" + string(max_scrap));
    
    if obj_weapon.rev_unlocked = true draw_text(160, 240, "Revolver Ammo: " + string(sho_ammo) + "/" + string(max_sho_ammo));
        
    if obj_weapon.sho_unlocked = true draw_text(160, 265, "Shotgun Ammo: " + string(sho_ammo) + "/" + string(max_sho_ammo));
        
    if obj_weapon.rif_unlocked = true draw_text(160, 290, "Rifle Ammo: " + string(rif_ammo) + "/" + string(max_rif_ammo));
    
}