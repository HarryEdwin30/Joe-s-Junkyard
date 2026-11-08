if (!global.menu) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 128) {
    	if (!draw_gui) {
            obj_player.can_move = false;
        	draw_gui = true;
            global.menu = true;
            audio_play_sound(car_open, 0, false);
        }
    }
}