if draw_backpack_ui = true{
    draw_set_font(backpackfont2);
    draw_set_colour(c_red);
    draw_sprite(spr_transition_ammo, -1, obj_x, obj_y);
    if obj_text_color = c_black{
        draw_rectangle_colour(obj_x, obj_y, obj_x + 128, obj_y + 32, c_red, c_red, c_red, c_red, false);
    }
    draw_text_colour(obj_x + 20, obj_y + 3, "Move Ammo", obj_text_color, obj_text_color, obj_text_color, obj_text_color , 1);
    draw_text(160, 150, "Backpack ---");
    draw_text(160, 190, "Beef Stew: " + string(bs));
    draw_text(160, 215, "Scrap: " + string(scrap));
    
    if obj_weapon.rev_unlocked = true draw_text(160, 240, "Revolver Ammo: " + string(sho_ammo));
        
    if obj_weapon.sho_unlocked = true draw_text(160, 265, "Shotgun Ammo: " + string(sho_ammo));
        
    if obj_weapon.rif_unlocked = true draw_text(160, 290, "Rifle Ammo: " + string(rif_ammo));
        
    draw_text(340, 290, "Weight: " + string(weight) + "/" + string(max_weight));
    
}