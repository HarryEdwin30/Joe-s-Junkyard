if (global.save_game) {
	data.exists = exists;
    data.bs = bs;
    data.scrap = scrap;
    data.rev_ammo = rev_ammo;
    data.sho_ammo = sho_ammo;
    data.rif_ammo = rif_ammo;
    data.zev_cakes = zev_cakes;
    
    global.data[$ key] = data;
}

if (!exists) {
	instance_destroy();
}

if instance_exists(obj_player){
    var cam = view_camera[0];
    
    var camx1 = camera_get_view_x(cam);
    var camy1 = camera_get_view_y(cam);
    var camx2 = camera_get_view_x(cam) + camera_get_view_width(cam);
    var camy2 = camera_get_view_y(cam) + camera_get_view_height(cam);
    
    if (point_in_rectangle(x, y, camx1, camy1, camx2, camy2)) {
    	if !collision_line(x, y, obj_player.x, obj_player.y, global.opaque_obstacles, false, undefined) or global.see_all{
            image_alpha = 1;
        }
        else if image_alpha > 0{ 
            image_alpha -= 0.01;
        }
    }
    else if (image_alpha != 0){
    	image_alpha = 0;
    }
}

if bs = 0 and scrap = 0 and rev_ammo = 0 and sho_ammo = 0 and rif_ammo = 0 and zev_cakes = 0 and !chest_empty {
    chest_empty = true;
    image_index = 1;
}
if (position_meeting(mouse_x, mouse_y, id)) {
    if (!global.menu and point_distance(obj_player.x, obj_player.y, cx, cy) < global.mdfc and !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, global.closed_obstacles, true, true)) {
        draw_outline = true;
        if mouse_check_button_pressed(mb_right){
            if draw_gui = false{
                if (!global.menu) {
                    draw_gui = true;
                    obj_player.can_move = false;
                    audio_play_sound(chest_open, 0, false);
                    global.menu = true;
                }
            }
        }
    }
}
else if (draw_outline) {
	draw_outline = false;
}

if draw_gui = true{
    
    if bs_tamount + scrap_tamount + rev_tamount + sho_tamount + rif_tamount + zc_tamount > 0{ // most epic if statement ever written???!
    draw_take_options = true;
    }
    else draw_take_options = false;

    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    var dbutton_size = 16; //this can be used for both width and height because the drop button is a square
    
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
    
    if (keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_tab)) {
        draw_gui = false;
        obj_player.can_move = true;
        audio_play_sound(chest_close, 0, false);
        
        bs_tamount = 0;
        scrap_tamount = 0;
        rev_tamount = 0;
        sho_tamount = 0;
        rif_tamount = 0;
        zc_tamount = 0;
        
        global.menu = false;
    }
    
    //here we're gonna detect if the mouse is hovering over the buttons
    
    if mouse_gui_x >= dbutton_x1 && mouse_gui_x <= dbutton_x2{ //all the drop buttons are at the same x
        //this is caveman activity and copy paste from backpack
        if mouse_gui_y >= bs_dbutton_y1 && mouse_gui_y <= bs_dbutton_y2{ // beef stew
            if mouse_check_button_pressed(mb_left){
                if bs_tamount < bs{
                    bs_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if bs_tamount != bs{
                    bs_tamount = bs;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    bs_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if bs_tamount < bs{
                            bs_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if bs_tamount > 0{
                    bs_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if bs_tamount > 0{
                            bs_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= scrap_dbutton_y1 && mouse_gui_y <= scrap_dbutton_y2{ // scrap
            if mouse_check_button_pressed(mb_left){
                if scrap_tamount < scrap{
                    scrap_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if scrap_tamount < scrap{
                            scrap_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if scrap_tamount != scrap{
                    scrap_tamount = scrap;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    scrap_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_right){
                if scrap_tamount > 0{
                    scrap_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if scrap_tamount > 0{
                            scrap_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= rev_ammo_dbutton_y1 && mouse_gui_y <= rev_ammo_dbutton_y2{ // rev_ammo
            if mouse_check_button_pressed(mb_left){
                if rev_tamount < rev_ammo{
                    rev_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if rev_tamount != rev_ammo{
                    rev_tamount = rev_ammo;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    rev_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rev_tamount < rev_ammo{
                            rev_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if rev_tamount > 0{
                    rev_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rev_tamount > 0{
                            rev_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= sho_ammo_dbutton_y1 && mouse_gui_y <= sho_ammo_dbutton_y2{ // sho ammo
            if mouse_check_button_pressed(mb_left){
                if sho_tamount < sho_ammo{
                    sho_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if sho_tamount != sho_ammo{
                    sho_tamount = sho_ammo;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    sho_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if sho_tamount < sho_ammo{
                            sho_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_right){
                if sho_tamount > 0{
                    sho_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if sho_tamount > 0{
                            sho_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= rif_ammo_dbutton_y1 && mouse_gui_y <= rif_ammo_dbutton_y2{ // rif ammo
            if mouse_check_button_pressed(mb_left){
                if rif_tamount < rif_ammo{
                    rif_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rif_tamount < rif_ammo{
                            rif_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if rif_tamount != rif_ammo{
                    rif_tamount = rif_ammo;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    rif_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_right){
                if rif_tamount > 0{
                    rif_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if rif_tamount > 0{
                            rif_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
        
        if mouse_gui_y >= zev_cake_dbutton_y1 && mouse_gui_y <= zev_cake_dbutton_y2{ // zev cakes
            if mouse_check_button_pressed(mb_left){
                if zc_tamount < zev_cakes{
                    zc_tamount += 1;
                    audio_play_sound(item_subtract, 0, false);
                }
            }
            if mouse_check_button(mb_left){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if zc_tamount < zev_cakes{
                            zc_tamount += 1;
                            audio_play_sound(item_subtract, 0, false);
                        }
                    }
                }
            }
            if mouse_check_button_pressed(mb_middle){
                if zc_tamount != zev_cakes{
                    zc_tamount = zev_cakes;
                    audio_play_sound(item_subtract, 0, false);
                }
                else{
                    zc_tamount = 0;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button_pressed(mb_right){
                if zc_tamount > 0{
                    zc_tamount -= 1;
                    audio_play_sound(item_add_back, 0, false);
                }
            }
            if mouse_check_button(mb_right){
                if drop_rapid_delay > 0 drop_rapid_delay -= 1;
                
                if drop_rapid_delay <= 0{
                    time_between_rapid_drops -= 1;
                    if time_between_rapid_drops <= 0{
                        time_between_rapid_drops = time_between_rapid_drops_max
                        if zc_tamount > 0{
                            zc_tamount -= 1;
                            audio_play_sound(item_add_back, 0, false);
                        }
                    }
                }
            }
        }
    } //caveman activity completed
    
    if draw_take_options = true{
        var take_y1 = obj_y + 50;
        var take_y2 = take_y1 + 32;
        
        var cancel_y1 = obj_y + 100;
        var cancel_y2 = cancel_y1 + 32;
        
        if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
            if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128{
                if mouse_gui_y >= take_y1 && mouse_gui_y <= take_y2{
                    if mouse_check_button_pressed(mb_left){
                        var new_weight = obj_backpack.weight + ((bs_tamount * obj_backpack.bs_weight) + (scrap_tamount * obj_backpack.scrap_weight) + (rev_tamount) + (sho_tamount) + (rif_tamount * obj_backpack.rif_ammo_weight) + (zc_tamount * obj_backpack.zev_cake_weight))
                        if new_weight > obj_backpack.max_weight{
                            audio_play_sound(cant_do_that, 0, false);
                        }
                        else{
                            audio_play_sound(bp_select, 0, false);
                            obj_backpack.bs += bs_tamount;
                            obj_backpack.scrap += scrap_tamount;
                            obj_backpack.rev_ammo += rev_tamount;
                            obj_backpack.sho_ammo += sho_tamount;
                            obj_backpack.rif_ammo += rif_tamount;
                            obj_backpack.zev_cakes += zc_tamount;
                            
                            bs -= bs_tamount;
                            scrap -= scrap_tamount;
                            rev_ammo -= rev_tamount;
                            sho_ammo -= sho_tamount;
                            rif_ammo -= rif_tamount;
                            zev_cakes -= zc_tamount;
                            
                            bs_tamount = 0;
                            scrap_tamount = 0;
                            rev_tamount = 0
                            sho_tamount = 0;
                            rif_tamount = 0;
                            zc_tamount = 0;
                        }
                    }
                }
            }
            if mouse_gui_y >= cancel_y1 && mouse_gui_y <= cancel_y2{
                if mouse_check_button_pressed(mb_left){
                    audio_play_sound(item_add_back, 0, false);
                    bs_tamount = 0;
                    scrap_tamount = 0;
                    rev_tamount = 0;
                    sho_tamount = 0;
                    rif_tamount = 0;
                    zc_tamount = 0;
                }
            }
        }
    }
}