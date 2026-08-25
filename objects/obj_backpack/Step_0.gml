if instance_exists(obj_drop_bag){
    if draw_backpack_ui = true{
        obj_drop_bag.cant_draw_ui = true;
    }
    else obj_drop_bag.cant_draw_ui = false;
}

if zev_cakes > 0{
    zev_cake_unlocked = true;
}

var total_bullet_weight = rev_ammo + sho_ammo + (rif_ammo * rif_ammo_weight);
var total_bs_weight = bs * bs_weight;
var total_scrap_weight = scrap * scrap_weight;
var total_weight = total_bs_weight + total_bullet_weight + total_scrap_weight;

weight = total_weight;

if bs_damount + scrap_damount + rev_damount + sho_damount + rif_damount + zc_damount > 0{ // most epic if statement ever written???!
    draw_drop_options = true;
}
else draw_drop_options = false;

if draw_backpack_ui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128 and mouse_gui_y >= obj_y && mouse_gui_y <= obj_y + 32{ //transfer ammo shit
    	obj_text_color = c_black;
        if mouse_check_button_pressed(mb_left){
            transfer_ammo_from_bp();
            audio_play_sound(bp_select, 0, false);
            bs_damount = 0;
            scrap_damount = 0;
            rev_damount = 0;
            sho_damount = 0;
            rif_damount = 0;
            zc_damount = 0;
        }
    }
    else{
        obj_text_color = c_red;
    }
    
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
    
    //here we're gonna detect if the mouse is hovering over the buttons
    
    if mouse_gui_x >= dbutton_x1 && mouse_gui_x <= dbutton_x2{ //all the drop buttons are at the same x
        //this is caveman activity
        if mouse_gui_y >= bs_dbutton_y1 && mouse_gui_y <= bs_dbutton_y2{ // beef stew
            if mouse_check_button_pressed(mb_left){
                if bs_damount < bs{
                    bs_damount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if bs_damount < bs{
                            bs_damount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if bs_damount > 0{
                    bs_damount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if bs_damount > 0{
                            bs_damount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= scrap_dbutton_y1 && mouse_gui_y <= scrap_dbutton_y2{ // scrap
            if mouse_check_button_pressed(mb_left){
                if scrap_damount < scrap{
                    scrap_damount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if scrap_damount < scrap{
                            scrap_damount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if scrap_damount > 0{
                    scrap_damount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if scrap_damount > 0{
                            scrap_damount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= rev_ammo_dbutton_y1 && mouse_gui_y <= rev_ammo_dbutton_y2{ // rev_ammo
            if mouse_check_button_pressed(mb_left){
                if rev_damount < rev_ammo{
                    rev_damount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rev_damount < rev_ammo{
                            rev_damount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if rev_damount > 0{
                    rev_damount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rev_damount > 0{
                            rev_damount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= sho_ammo_dbutton_y1 && mouse_gui_y <= sho_ammo_dbutton_y2{ // sho ammo
            if mouse_check_button_pressed(mb_left){
                if sho_damount < sho_ammo{
                    sho_damount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if sho_damount < sho_ammo{
                            sho_damount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if sho_damount > 0{
                    sho_damount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if sho_damount > 0{
                            sho_damount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= rif_ammo_dbutton_y1 && mouse_gui_y <= rif_ammo_dbutton_y2{ // rif ammo
            if mouse_check_button_pressed(mb_left){
                if rif_damount < rif_ammo{
                    rif_damount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rif_damount < rif_ammo{
                            rif_damount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if rif_damount > 0{
                    rif_damount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rif_damount > 0{
                            rif_damount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= zev_cake_dbutton_y1 && mouse_gui_y <= zev_cake_dbutton_y2{ // zev cakes
            if mouse_check_button_pressed(mb_left){
                if zc_damount < zev_cakes{
                    zc_damount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if zc_damount < zev_cakes{
                            zc_damount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if zc_damount > 0{
                    zc_damount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if zc_damount > 0{
                            zc_damount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
    } //caveman activity completed
    
    if draw_drop_options = true{
        var drop_y1 = obj_y + 50;
        var drop_y2 = drop_y1 + 32;
        
        var cancel_y1 = obj_y + 100;
        var cancel_y2 = cancel_y1 + 32;
        
        if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
            if mouse_gui_y >= drop_y1 && mouse_gui_y <= drop_y2{
                if mouse_check_button_pressed(mb_left){
                    if position_meeting(obj_player.x, obj_player.y, obj_drop_bag){
                        audio_play_sound(cant_do_that, 0, false);
                    }
                    else{
                        audio_play_sound(bp_select, 0, false);
                        var bag = instance_create_depth(obj_player.x, obj_player.y, 0, obj_drop_bag);
                        bag.bs += bs_damount;
                        bs -= bs_damount
                        bs_damount -= bs_damount;
                        
                        bag.scrap += scrap_damount;
                        scrap -= scrap_damount
                        scrap_damount -= scrap_damount;
                        
                        bag.rev_ammo += rev_damount;
                        rev_ammo -= rev_damount
                        rev_damount -= rev_damount;
                        
                        bag.sho_ammo += sho_damount;
                        sho_ammo -= sho_damount
                        sho_damount -= sho_damount;
                        
                        bag.rif_ammo += rif_damount;
                        rif_ammo -= rif_damount
                        rif_damount -= rif_damount;
                        
                        bag.zev_cakes += zc_damount;
                        zev_cakes -= zc_damount
                        zc_damount -= zc_damount;
                    }
                }
            }
            if mouse_gui_y >= cancel_y1 && mouse_gui_y <= cancel_y2{
                if mouse_check_button_pressed(mb_left){
                    audio_play_sound(item_add_back, 0, false);
                    bs_damount = 0;
                    scrap_damount = 0;
                    rev_damount = 0;
                    sho_damount = 0;
                    rif_damount = 0;
                    zc_damount = 0;
                }
            }
        }
    }
}