if obj_backpack.draw_backpack_ui = true or global.draw_esc_menu_gui = true exit;
    
if instance_exists(obj_chest){
    if instance_nearest(obj_player.x, obj_player.y, obj_chest).draw_gui = true exit;
}

if keyboard_check_pressed(ord("E")){
    if draw_gui = false{
        obj_player.can_move = false;
        draw_gui = true;
    }
    else{
        obj_player.can_move = true;
        draw_gui = false;
        bs_tamount = 0;
        scrap_tamount = 0;
        rev_tamount = 0;
        sho_tamount = 0;
        rif_tamount = 0;
        zc_tamount = 0;
    }
}