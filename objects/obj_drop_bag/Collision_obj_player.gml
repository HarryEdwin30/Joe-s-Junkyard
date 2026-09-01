if obj_backpack.draw_backpack_ui = true or global.draw_esc_menu_gui = true exit;

if keyboard_check_pressed(ord("E")){
    if draw_gui = false{
        obj_player.can_move = false;
        draw_gui = true;
    }
    else{
        obj_player.can_move = true;
        draw_gui = false;
    }
}