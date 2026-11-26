if (position_meeting(mouse_x, mouse_y, id)) {
	if (point_distance(obj_player.x, obj_player.y, x, y) < 64) {
    	draw_outline = true;
        if (mouse_check_button_pressed(mb_right)) {
            if (!fought_horde and been_to_town) {
                if (!horde_triggered) {
                    horde_triggered = true;
                    obj_next_day.can_sleep = true;
                    glog("Horde alerted!", 2, hordealert);
                	switch (global.game_day) {
                    	case 1:
                            boss1 = true;
                            break;
                        case 2:
                            boss2 = true;
                            break;
                        case 3:
                            boss3 = true;
                            break;
                        case 4:
                            boss4 = true;
                            break;
                        case 5:
                            boss5 = true;
                            break;
                        case 6:
                            boss6 = true;
                            break;
                        case 7:
                            boss7 = true;
                            break;
                    }
                }
            }
        }
    }
} else {
    draw_outline = false;
}

//bad code? lalalala can't hear you

if (boss1) {
	boss1 = false;
    fought_horde = true;
    horde_triggered = false;
} else if (boss2) {
    boss2 = false;
    fought_horde = true;
    horde_triggered = false;
} else if (boss3) {
    boss3 = false;
    fought_horde = true;
    horde_triggered = false;
} else if (boss4) {
    boss4 = false;
    fought_horde = true;
    horde_triggered = false;
} else if (boss5) {
    boss5 = false;
    fought_horde = true;
    horde_triggered = false;
} else if (boss6) {
    boss6 = false;
    fought_horde = true;
    horde_triggered = false;
} else if (boss7) {
    boss7 = false;
    fought_horde = true;
    horde_triggered = false;
}