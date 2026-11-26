if (position_meeting(mouse_x, mouse_y, id)) {
	draw_outline = true;
    if (mouse_check_button_pressed(mb_right)) {
        if (obj_bossfight_director.fought_horde && can_sleep) {
            audio_stop_all();
            sleep_time = sleep_time_max;
            run_sleep_protocol = true;
            obj_player.can_move = false;
            global.menu = true;
            audio_play_sound(mus_goodmorning, 0, false);
        }
    }
} else {
    draw_outline = false;
}