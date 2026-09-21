if keyboard_check_pressed(ord("E")){
    if global.draw_esc_menu_gui = true or obj_backpack.draw_backpack_ui = true{
        exit;
    }
    if instance_exists(obj_drop_bag){
        if instance_nearest(obj_player.x, obj_player.y, obj_drop_bag).draw_gui = true exit;
    }
    if draw_gui = false{
        draw_gui = true;
        obj_player.can_move = false;
        audio_play_sound(chest_open, 0, false);
    }
    else{
        draw_gui = false;
        obj_player.can_move = true;
        audio_play_sound(chest_close, 0, false);
        
        bs_tamount = 0;
        scrap_tamount = 0;
        rev_tamount = 0;
        sho_tamount = 0;
        rif_tamount = 0;
        zc_tamount = 0;
    }
}