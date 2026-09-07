if global.player_alive = false exit;
    
if obj_backpack.draw_backpack_ui = true exit;
    
if instance_exists(obj_chest){
    if instance_nearest(obj_player.x, obj_player.y, obj_chest).draw_gui = true exit;
}
    
if instance_exists(obj_drop_bag){
    if instance_nearest(obj_player.x, obj_player.y, obj_drop_bag).draw_gui = true exit;
}

if global.draw_esc_menu_gui = false{
    global.draw_esc_menu_gui = true;
    audio_play_sound(cant_do_that, 0, false);
}
else{
    global.draw_esc_menu_gui = false;
    audio_play_sound(bp_select, 0, false);
}