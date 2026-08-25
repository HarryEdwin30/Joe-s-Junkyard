if cant_draw_ui = true exit;

if keyboard_check_pressed(ord("E")){
    if draw_gui = false{
        obj_player.can_move = false;
        obj_backpack.cant_draw_ui = true;
        draw_gui = true;
    }
    else{
        obj_player.can_move = true;
        draw_gui = false;
        obj_backpack.cant_draw_ui = false;
    }
}