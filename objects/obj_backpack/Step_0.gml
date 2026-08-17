if zev_cakes > 0{
    zev_cake_unlocked = true;
}

var total_bullet_weight = rev_ammo + sho_ammo + (rif_ammo * rif_ammo_weight);
var total_bs_weight = bs * bs_weight;
var total_scrap_weight = scrap * scrap_weight;
var total_weight = total_bs_weight + total_bullet_weight + total_scrap_weight;

weight = total_weight;

if draw_backpack_ui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    if mouse_gui_x >= obj_x && mouse_gui_x <= obj_x + 128 and mouse_gui_y >= obj_y && mouse_gui_y <= obj_y + 32{
    	obj_text_color = c_black;
        if mouse_check_button_pressed(mb_left){
            transfer_ammo_from_bp();
        }
    }
    else{
        obj_text_color = c_red;
    }
}