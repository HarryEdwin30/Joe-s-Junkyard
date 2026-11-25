if (position_meeting(mouse_x, mouse_y, id)) {
	draw_outline = true;
    if (mouse_check_button_pressed(mb_right)) {
    	next_day();
    }
} else {
    draw_outline = false;
}