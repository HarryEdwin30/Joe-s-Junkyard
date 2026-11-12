if (position_meeting(mouse_x, mouse_y, id)) {
	if (point_distance(obj_player.x, obj_player.y, x, y) < 64) {
    	draw_outline = true;
        if (mouse_check_button_pressed(mb_right) && !horde_triggered) {
            if (global.game_day <= 1) {
            	glog("Maybe tomorrow.", 3);
            } else {
            	horde_triggered = true;
                glog("Horde alerted!", 3, hordealert);
                if (global.game_day == 2) {
                	
                } else if (global.game_day == 3) {
                    
                }
            }
        }
    }
} else {
    draw_outline = false;
}

if (boss1) {
	
}