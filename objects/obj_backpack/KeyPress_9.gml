if global.draw_esc_menu_gui = true exit;
    
if instance_exists(obj_drop_bag){
    if obj_drop_bag.draw_gui = true exit;
}
if instance_exists(obj_chest){
    if obj_chest.draw_gui = true exit;
}
    
if draw_backpack_ui = false{
    obj_player.can_move = false;
    draw_backpack_ui = true;
    audio_play_sound(bp_open, 0, false);
}
else{
    obj_player.can_move = true;
    draw_backpack_ui = false;
    audio_play_sound(bp_close, 0, false);
    
    bs_damount = 0;
    scrap_damount = 0;
    rev_damount = 0;
    sho_damount = 0;
    rif_damount = 0;
    zc_damount = 0;
}