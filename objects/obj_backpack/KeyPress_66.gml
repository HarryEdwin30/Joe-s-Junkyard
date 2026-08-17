if draw_backpack_ui = false{
    obj_player.can_move = false;
    draw_backpack_ui = true;
    audio_play_sound(bp_open, 0, false);
}
else{
    obj_player.can_move = true;
    draw_backpack_ui = false;
    
    audio_play_sound(bp_close, 0, false);
}