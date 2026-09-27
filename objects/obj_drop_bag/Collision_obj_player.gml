if keyboard_check_pressed(ord("E")){
    if draw_gui = false{
        if (!global.menu) {
            obj_player.can_move = false;
            draw_gui = true;
            global.menu = true;
        }
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
        
        global.menu = false;
    }
}