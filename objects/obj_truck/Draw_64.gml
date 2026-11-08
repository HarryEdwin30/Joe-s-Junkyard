if (draw_gui) {
	var xx = gui_x;
    var yy = gui_y;
    
    var str = "Scrap to add: " + string(add_scrap) + " / " + string(obj_supplies_depot.scrap);
    
    var str_width = string_width(str);
    
    var x1 = xx - 3;
    var y1 = yy - 3;
    var x2 = xx + str_width + 3;
    var y2 = yy + 61;
    
    draw_set_colour(c_black);
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_colour(c_red);
    draw_rectangle(x1, y1, x2, y2, true);
    
    draw_set_font(fancyfont);
    draw_text(xx, yy, "Repair car:");
    draw_text(xx, yy + 20, str);
    
    var bx1 = xx;
    var by1 = yy + 40;
    var bx2 = bx1 + sprite_get_width(spr_drop_button);
    var by2 = by1 + sprite_get_height(spr_drop_button);
    
    var img = 0;
    
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    if (point_in_rectangle(mx, my, bx1, by1, bx2, by2)) { //so i know how this looks, right
    	img = 1;
        
        var rscrap = obj_supplies_depot.scrap;
        
        if (!mouse_check_button(mb_left) and !mouse_check_button(mb_right)) {
        	drop_rapid_delay = drop_rapid_delay_max;
        }
        
        if mouse_check_button_pressed(mb_left){
            if (add_scrap < rscrap) {
            	add_scrap += 1;
                audio_play_sound(item_subtract, 0, false);
            }
        }
        if mouse_check_button_pressed(mb_middle){
            if (add_scrap < rscrap) {
            	add_scrap = rscrap;
                audio_play_sound(item_subtract, 0, false);
            } else {
                add_scrap = 0;
                audio_play_sound(item_add_back, 0, false);
            }
        }
        if mouse_check_button(mb_left){
            if drop_rapid_delay > 0 drop_rapid_delay -= 1;
            
            if drop_rapid_delay <= 0{
                time_between_rapid_drops -= 1;
                if time_between_rapid_drops <= 0{
                    time_between_rapid_drops = time_between_rapid_drops_max;
                    if (add_scrap < rscrap) {
                    	add_scrap += 1;
                        audio_play_sound(item_subtract, 0, false);
                    }
                }
            }
        }
        if mouse_check_button_pressed(mb_right){
            if (add_scrap > 0) {
            	add_scrap -= 1;
                audio_play_sound(item_add_back, 0, false);
            }
        }
        if mouse_check_button(mb_right){
            if drop_rapid_delay > 0 drop_rapid_delay -= 1;
            
            if drop_rapid_delay <= 0{
                time_between_rapid_drops -= 1;
                if time_between_rapid_drops <= 0{
                    time_between_rapid_drops = time_between_rapid_drops_max;
                    if (add_scrap > 0) {
                    	add_scrap -= 1;
                        audio_play_sound(item_add_back, 0, false);
                    }
                }
            }
        }
    }
    
    draw_sprite(spr_drop_button, img, bx1, by1);
    
    var b2str = "Repair";
    
    var b2spr_width = string_width(b2str);
    var b2spr_height = string_height(b2str);
    
    var b2x1 = xx + 65;
    var b2y1 = yy - 2;
    var b2x2 = b2x1 + b2spr_width + 1;
    var b2y2 = b2y1 + b2spr_height;
    
    var b2strc = c_red;
    
    var b2c1 = c_black;
    var b2c2 = c_red;
    
    if (point_in_rectangle(mx, my, b2x1, b2y1, b2x2, b2y2)) { //sir please
        b2strc = c_black;
        b2c1 = c_red;
        b2c2 = c_black;
        if (mouse_check_button_pressed(mb_left)) {
        	obj_supplies_depot.scrap -= add_scrap;
            scrap += add_scrap;
            add_scrap = 0;
            audio_play_sound(repair, 0, false);
        }
    }
    
    draw_set_colour(b2c1);
    draw_rectangle(b2x1, b2y1, b2x2, b2y2, false);
    draw_set_colour(b2c2);
    draw_rectangle(b2x1, b2y1, b2x2, b2y2, true);
    
    var b2strx = b2x1;
    var b2stry = b2y1;
    
    draw_set_colour(b2strc);
    draw_text(b2x1, b2y1, b2str);
}