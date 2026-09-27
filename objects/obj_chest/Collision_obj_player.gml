if keyboard_check_pressed(ord("E")){
    if draw_gui = false{
        if (!global.menu) {
            draw_gui = true;
            obj_player.can_move = false;
            audio_play_sound(chest_open, 0, false);
            global.menu = true;
        }
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
        
        global.menu = false;
    }
}