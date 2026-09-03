if keyboard_check_pressed(ord("E")){
    if global.draw_esc_menu_gui = true or obj_backpack.draw_backpack_ui = true{
        exit;
    }
    if instance_exists(obj_drop_bag){
        if obj_drop_bag.draw_gui = true exit;
    }
    if draw_gui = false{
        draw_gui = true;
        obj_player.can_move = false;
    }
    else{
        draw_gui = false;
        obj_player.can_move = true;
        
        bs_damount = 0;
        scrap_damount = 0;
        rev_damount = 0;
        sho_damount = 0;
        rif_damount = 0;
        zc_damount = 0;
    }
}