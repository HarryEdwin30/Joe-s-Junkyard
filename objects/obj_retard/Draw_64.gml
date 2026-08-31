if show_dev_stats = false exit;
    
draw_set_colour(c_white);
draw_text(0, 0, "FPS: " + string(fps_real));
draw_text(0, 20, "Zombies: " + string(instance_number(obj_zombie_parent)));
if instance_exists(obj_ai_director){
    if obj_ai_director.enabled = true draw_text(0, 40, "AI Director enabled");
        else draw_text(0, 40, "AI Director disabled");
}

if global.draw_esc_menu_gui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    draw_set_font(backpackfont2);
    draw_set_colour(c_red);
    
    var b_x1 = 160;
    var b_x2 = b_x1 + 128;
    
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
    
    draw_text(160, 150, "Menu ---");
    
    draw_sprite(spr_backpack_button, mmb_f, b_x1, mmb_y1);
    draw_text_colour(b_x1 + 30, mmb_y1 + 5, "Main Menu", mmb_tc, mmb_tc, mmb_tc, mmb_tc, 1);
}