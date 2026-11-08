if (keyboard_check_pressed(vk_tab) or keyboard_check_pressed(ord("E"))) {
	if (draw_gui) {
        obj_player.can_move = true;
    	draw_gui = false;
        global.menu = false;
        audio_play_sound(car_close, 0, false);
        add_scrap = 0;
    }
}