if show_dev_stats = true{
    draw_set_colour(c_white);
    draw_text(0, 0, "press f1 to hide/open dev stats");
    draw_text(0, 20, "FPS: " + string(fps_real));
    draw_text(0, 40, "Zombies: " + string(instance_number(obj_zombie_parent)));
    if instance_exists(obj_ai_director){
        if obj_ai_director.enabled = true draw_text(0, 60, "AI Director enabled   (f2)");
            else draw_text(0, 60, "AI Director disabled   (f2)");
    }
    else draw_text(0, 60, "AI Director disabled   (f2)");
    if global.godmode = true{
        draw_text(0, 80, "Godmode on   (ctrl + g)");
    }
    else draw_text(0, 80, "Godmode off   (ctrl + g)");
        
    if global.invisible = true{
        draw_text(0, 100, "Invisible on   (ctrl + i)");
    }
    else draw_text(0, 100, "Invisible off   (ctrl + i)");
        
    if (global.zombie_omniscience) {
    	draw_text(0, 120, "Omniscience on   (ctrl + o)");
    }
    else {
    	draw_text(0, 120, "Omniscience off   (ctrl + o)");
    }
    draw_text(0, 140, "Spawn mode: " + string(spawn_mode) + "   (ctrl + m)");
    if (global.see_all) {
    	draw_text(0, 160, "See All on    (ctrl + l)");
    }
    else {
    	draw_text(0, 160, "See All off   (ctrl + l)");
    }
}

if global.draw_esc_menu_gui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    draw_set_font(backpackfont2);
    draw_set_colour(c_red);
    
    var b_x1 = 160;
    var b_x2 = b_x1 + 128;
    var sb_x1 = 315;
    var sb_x2 = sb_x1 + 64;
    
    var mmb_y1 = 180;
    var mmb_y2 = mmb_y1 + 32;
    var mmb_tc = c_red; //text color
    var mmb_f = 0; //frame
    
    if mouse_gui_x >= b_x1 && mouse_gui_x <= b_x2{
        if mouse_gui_y >= mmb_y1 and mouse_gui_y <= mmb_y2{
            mmb_tc = c_black;
            mmb_f = 1;
        }
    }
    if draw_mm_options = true{
        var second_b_dist = 84;
        var yes_f = 0;
        var no_f = 0;
        var yes_c = c_red;
        var no_c = c_red;
        
        if mouse_gui_y >= mmb_y1 and mouse_gui_y <= mmb_y2{
            if mouse_gui_x >= sb_x1 and mouse_gui_x <= sb_x2{
                yes_f = 1;
                yes_c = c_black;
            }
            if mouse_gui_x >= sb_x1 + second_b_dist and mouse_gui_x <= sb_x2 + second_b_dist{
                no_f = 1;
                no_c = c_black;
            }
        }
        
        draw_sprite(spr_ui_box_small, yes_f, sb_x1, mmb_y1)
        draw_sprite(spr_ui_box_small, no_f, sb_x1 + second_b_dist, mmb_y1)
        
        draw_text_colour(sb_x1 + 22, mmb_y1 + 6, "Yes", yes_c, yes_c, yes_c, yes_c, 1);
        draw_text_colour(sb_x1 + second_b_dist + 25, mmb_y1 + 6, "No", no_c, no_c, no_c, no_c, 1);
        
        draw_text(sb_x1 + 35, mmb_y1 - 27, "Are you sure?")
    }
    
    draw_text(160, 150, "Menu ---");
    
    draw_sprite(spr_backpack_button, mmb_f, b_x1, mmb_y1);
    draw_text_colour(b_x1 + 30, mmb_y1 + 5, "Main Menu", mmb_tc, mmb_tc, mmb_tc, mmb_tc, 1);
}