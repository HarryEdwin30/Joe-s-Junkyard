if (position_meeting(mouse_x, mouse_y, id)) {
	draw_outline = true;
    if (mouse_check_button_pressed(mb_right)) {
        show_debug_message("cs" + string(can_sleep));
        show_debug_message("fh" + string(obj_bossfight_director.fought_horde));
        show_debug_message("btt" + string(obj_bossfight_director.been_to_town));
    	next_day();
    }
} else {
    draw_outline = false;
}