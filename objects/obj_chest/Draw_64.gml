if draw_gui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    draw_set_font(backpackfont2);
    draw_set_colour(c_red);
    if chest_empty = true{
        draw_text(110, 150, "Chest --- This chest is empty.");
    }
    else{
        draw_text(110, 150, "Chest --- Be careful what you take! You won't be able to return it.");
    }
    
    var bp_text_x = 320;
    if bs > 0{
        draw_text(110, 190, "Beef Stew: " + string(bs));
        draw_text(bp_text_x, 190, "BP: " + string(obj_backpack.bs));
    }
    
    if scrap > 0{
        draw_text(110, 215, "Scrap: " + string(scrap));
        draw_text(bp_text_x, 215, "BP: " + string(obj_backpack.scrap));
    }
    
    if rev_ammo > 0{
        draw_text(110, 240, "Revolver Ammo: " + string(rev_ammo));
        draw_text(bp_text_x, 240, "BP: " + string(obj_backpack.rev_ammo));
    }
        
    if sho_ammo > 0{
        draw_text(110, 265, "Shotgun Ammo: " + string(sho_ammo));
        draw_text(bp_text_x, 265, "BP: " + string(obj_backpack.sho_ammo));
    }
        
    if rif_ammo > 0{
        draw_text(110, 290, "Rifle Ammo: " + string(rif_ammo));
        draw_text(bp_text_x, 290, "BP: " + string(obj_backpack.rif_ammo));
    }
        
    if zev_cakes > 0{
        draw_text(110, 315, "Zev Cakes: " + string(zev_cakes));
        draw_text(bp_text_x, 315, "BP: " + string(obj_backpack.zev_cakes));
    }
        
    //this code down here is just a copy paste from the backpack
    var dbutton_size = 16;
    
    var dbutton_x1 = 245;
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
    
    if mouse_gui_x >= dbutton_x1 && mouse_gui_x <= dbutton_x2{
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
    
    
    
    if bs_tamount > 0 draw_text(dbutton_x2 + 5, bs_dbutton_y2 - 16, "+ " + string(bs_tamount));
        
    if scrap_tamount > 0 draw_text(dbutton_x2 + 5, scrap_dbutton_y2 - 16, "+ " + string(scrap_tamount));
        
    if rev_tamount > 0 draw_text(dbutton_x2 + 5, rev_ammo_dbutton_y2 - 16, "+ " + string(rev_tamount));
        
    if sho_tamount > 0 draw_text(dbutton_x2 + 5, sho_ammo_dbutton_y2 - 16, "+ " + string(sho_tamount));
        
    if rif_tamount > 0 draw_text(dbutton_x2 + 5, rif_ammo_dbutton_y2 - 16, "+ " + string(rif_tamount));
        
    if zc_tamount > 0 draw_text(dbutton_x2 + 5, zev_cake_dbutton_y2 - 16, "+ " + string(zc_tamount));
    
    //we're gonna draw the drop buttons down here
    if bs > 0 draw_sprite(spr_drop_button, bs_dbutton_f, dbutton_x1, bs_dbutton_y1); //beef
    if scrap > 0 draw_sprite(spr_drop_button, scrap_dbutton_f, dbutton_x1, scrap_dbutton_y1); //scrap
    if rev_ammo > 0 draw_sprite(spr_drop_button, rev_ammo_dbutton_f, dbutton_x1, rev_ammo_dbutton_y1); //rev ammo
    if sho_ammo > 0 draw_sprite(spr_drop_button, sho_ammo_dbutton_f, dbutton_x1, sho_ammo_dbutton_y1); //sho ammo
    if rif_ammo > 0 draw_sprite(spr_drop_button, rif_ammo_dbutton_f, dbutton_x1, rif_ammo_dbutton_y1); //rif ammo
    if zev_cakes > 0{
        draw_sprite(spr_drop_button, zev_cake_dbutton_f, dbutton_x1, zev_cake_dbutton_y1); //zev cakes
    }
    if draw_take_options = true{
        var take_f = 0;
        var cancel_f = 0;
        var take_c = c_red;
        var cancel_c = c_red;
        
        var take_y1 = obj_y + 50;
        var take_y2 = take_y1 + 32;
        
        var cancel_y1 = obj_y + 100;
        var cancel_y2 = cancel_y1 + 32;
        
        if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
            if mouse_gui_y >= take_y1 && mouse_gui_y <= take_y2{
                take_f = 1;
                take_c = c_black;
            }
            if mouse_gui_y >= cancel_y1 && mouse_gui_y <= cancel_y2{
                cancel_f = 1;
                cancel_c = c_black;
            }
        }
    
        draw_sprite(spr_backpack_button, take_f, obj_x, take_y1);
        draw_sprite(spr_backpack_button, cancel_f, obj_x, cancel_y1);
    
        draw_text_colour(obj_x + 52, take_y1 + 5, "Take", take_c, take_c, take_c, take_c, 1);
        draw_text_colour(obj_x + 44, cancel_y1 + 5, "Cancel", cancel_c, cancel_c, cancel_c, cancel_c, 1);
        var new_weight = obj_backpack.weight + ((bs_tamount * obj_backpack.bs_weight) + (scrap_tamount * obj_backpack.scrap_weight) + (rev_tamount) + (sho_tamount) + (rif_tamount * obj_backpack.rif_ammo_weight) + (zc_tamount * obj_backpack.zev_cake_weight))
        var nw_string = "New W: " + string(new_weight) + "/" + string(obj_backpack.max_weight)
        if new_weight > obj_backpack.max_weight{
            nw_string = "New W: " + string(new_weight) + "/" + string(obj_backpack.max_weight) + " !!!";
        }
        draw_text(obj_x, 290, nw_string);
    }
}