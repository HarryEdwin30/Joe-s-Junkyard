if draw_backpack_ui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    draw_set_font(backpackfont2);
    draw_set_colour(c_red);
    draw_rectangle_colour(obj_x, obj_y, obj_x + 128, obj_y + 32, c_red, c_red, c_red, c_red, false);
    if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128 and mouse_gui_y >= obj_y && mouse_gui_y <= obj_y + 32{
        
    }
    else draw_sprite(spr_backpack_button, 0, obj_x, obj_y);
    
    draw_text_colour(obj_x + 28, obj_y + 5, "Move Ammo", obj_text_color, obj_text_color, obj_text_color, obj_text_color , 1);
    draw_text(160, 150, "Backpack ---");
    draw_text(160, 190, "Beef Stew: " + string(bs));
    draw_text(160, 215, "Scrap: " + string(scrap));
    
    draw_text(160, 240, "Revolver Ammo: " + string(rev_ammo));
        
    draw_text(160, 265, "Shotgun Ammo: " + string(sho_ammo));
        
    draw_text(160, 290, "Rifle Ammo: " + string(rif_ammo));
        
    draw_text(365, 315, "W: " + string(weight) + "/" + string(max_weight));
    
    if zev_cake_unlocked = true draw_text(160, 315, "Zev Cakes: " + string(zev_cakes));
        
    
    var dbutton_size = 16; //this can be used for both width and height because the drop button is a square
    
    var dbutton_x1 = 290;
    var dbutton_x2 = dbutton_x1 + dbutton_size;
    
    var bs_dbutton_y1 = 190;
    var bs_dbutton_y2 = bs_dbutton_y1 + dbutton_size;
    
    var scrap_dbutton_y1 = 215;
    var scrap_dbutton_y2 = scrap_dbutton_y1 + dbutton_size;
    
    var rev_ammo_dbutton_y1 = 240;
    var rev_ammo_dbutton_y2 = rev_ammo_dbutton_y1 + dbutton_size;
    
    var sho_ammo_dbutton_y1 = 265;
    var sho_ammo_dbutton_y2 = sho_ammo_dbutton_y1 + dbutton_size;
    
    var rif_ammo_dbutton_y1 = 290;
    var rif_ammo_dbutton_y2 = rif_ammo_dbutton_y1 + dbutton_size;
    
    var zev_cake_dbutton_y1 = 315;
    var zev_cake_dbutton_y2 = zev_cake_dbutton_y1 + dbutton_size;
    
    var bs_dbutton_f = 0;
    var scrap_dbutton_f = 0;
    var rev_ammo_dbutton_f = 0;
    var sho_ammo_dbutton_f = 0;
    var rif_ammo_dbutton_f = 0;
    var zev_cake_dbutton_f = 0;
    
    //here we're gonna detect if the mouse is hovering over the buttons
    
    if mouse_gui_x >= dbutton_x1 && mouse_gui_x <= dbutton_x2{ //all the drop buttons are at the same x
        if mouse_gui_y >= bs_dbutton_y1 && mouse_gui_y <= bs_dbutton_y2{ // beef stew
            bs_dbutton_f = 1;
        }
        
        if mouse_gui_y >= scrap_dbutton_y1 && mouse_gui_y <= scrap_dbutton_y2{ // scrap
            scrap_dbutton_f = 1;
        }
        
        if mouse_gui_y >= rev_ammo_dbutton_y1 && mouse_gui_y <= rev_ammo_dbutton_y2{ // rev_ammo
            rev_ammo_dbutton_f = 1;
        }
        
        if mouse_gui_y >= sho_ammo_dbutton_y1 && mouse_gui_y <= sho_ammo_dbutton_y2{ // sho ammo
            sho_ammo_dbutton_f = 1;
        }
        
        if mouse_gui_y >= rif_ammo_dbutton_y1 && mouse_gui_y <= rif_ammo_dbutton_y2{ // rif ammo
            rif_ammo_dbutton_f = 1;
        }
        
        if mouse_gui_y >= zev_cake_dbutton_y1 && mouse_gui_y <= zev_cake_dbutton_y2{ // zev cakes
            zev_cake_dbutton_f = 1;
        }
    }
    
    
    
    if bs_damount > 0 draw_text(dbutton_x2 + 5, bs_dbutton_y2 - 16, "- " + string(bs_damount));
        
    if scrap_damount > 0 draw_text(dbutton_x2 + 5, scrap_dbutton_y2 - 16, "- " + string(scrap_damount));
        
    if rev_damount > 0 draw_text(dbutton_x2 + 5, rev_ammo_dbutton_y2 - 16, "- " + string(rev_damount));
        
    if sho_damount > 0 draw_text(dbutton_x2 + 5, sho_ammo_dbutton_y2 - 16, "- " + string(sho_damount));
        
    if rif_damount > 0 draw_text(dbutton_x2 + 5, rif_ammo_dbutton_y2 - 16, "- " + string(rif_damount));
        
    if zc_damount > 0 draw_text(dbutton_x2 + 5, zev_cake_dbutton_y2 - 16, "- " + string(zc_damount));
    
    //we're gonna draw the drop buttons down here
    if bs > 0 draw_sprite(spr_drop_button, bs_dbutton_f, dbutton_x1, bs_dbutton_y1); //beef
    if scrap > 0 draw_sprite(spr_drop_button, scrap_dbutton_f, dbutton_x1, scrap_dbutton_y1); //scrap
    if rev_ammo > 0 draw_sprite(spr_drop_button, rev_ammo_dbutton_f, dbutton_x1, rev_ammo_dbutton_y1); //rev ammo
    if sho_ammo > 0 draw_sprite(spr_drop_button, sho_ammo_dbutton_f, dbutton_x1, sho_ammo_dbutton_y1); //sho ammo
    if rif_ammo > 0 draw_sprite(spr_drop_button, rif_ammo_dbutton_f, dbutton_x1, rif_ammo_dbutton_y1); //rif ammo
    if zev_cake_unlocked = true and zev_cakes > 0{
        draw_sprite(spr_drop_button, zev_cake_dbutton_f, dbutton_x1, zev_cake_dbutton_y1); //zev cakes
    }
    
    //now let's draw drop options
    if draw_drop_options = true{
        var drop_f = 0;
        var cancel_f = 0;
        
        var drop_c = c_red;
        var cancel_c = c_red;
        
        var drop_y1 = obj_y + 50;
        var drop_y2 = drop_y1 + 32;
        
        var cancel_y1 = obj_y + 100;
        var cancel_y2 = cancel_y1 + 32;
        
        if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
            if mouse_gui_y >= drop_y1 && mouse_gui_y <= drop_y2{
                drop_f = 1;
                drop_c = c_black;
            }
            if mouse_gui_y >= cancel_y1 && mouse_gui_y <= cancel_y2{
                cancel_f = 1;
                cancel_c = c_black;
            }
        }
        draw_sprite(spr_backpack_button, drop_f, obj_x, drop_y1);
        draw_sprite(spr_backpack_button, cancel_f, obj_x, cancel_y1);
        draw_text_colour(obj_x + 52, drop_y1 + 5, "Drop", drop_c, drop_c, drop_c, drop_c, 1)
        draw_text_colour(obj_x + 44, cancel_y1 + 5, "Cancel", cancel_c, cancel_c, cancel_c, cancel_c, 1)
        
        var new_weight = weight - ((bs_damount * bs_weight) + (scrap_damount * scrap_weight) + (rev_damount) + (sho_damount) + (rif_damount * rif_ammo_weight) + (zc_damount * zev_cake_weight))
        draw_text(365, 290, "New W: " + string(new_weight) + "/" + string(max_weight));
    }
}