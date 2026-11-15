if (position_meeting(mouse_x, mouse_y, id)) {
	if (point_distance(obj_player.x, obj_player.y, x, y) < 64) {
    	if (!collision_line(obj_player.x, obj_player.y, x, y, global.closed_obstacles, false, true)) {
        	draw_outline = true;
            if (mouse_check_button_pressed(mb_right) and !global.menu) {
            	draw_gui = true;
                global.menu = true;
                obj_player.can_move = false;
                audio_play_sound(chest_open, 0, false);
            }
        }
    }
} else {
    draw_outline = false;
}