if (position_meeting(mouse_x, mouse_y, id)) {
	if (point_distance(obj_player.x, obj_player.y, x, y) < 64) {
    	draw_outline = true;
        if (mouse_check_button_pressed(mb_right)) {
            if (!fought_horde) {
                if (!horde_triggered) {
                    horde_triggered = true;
                    glog("Horde alerted!", 2, hordealert);
                	switch (global.game_day) {
                    	case 1:
                            boss1 = true;
                            break;
                    }
                }
            }
        }
    }
} else {
    draw_outline = false;
}

if (boss1) {
	boss1 = false;
    fought_horde = true;
    horde_triggered = false;
}