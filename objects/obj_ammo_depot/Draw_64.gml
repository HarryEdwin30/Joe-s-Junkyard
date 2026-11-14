if (draw_gui) {
    if (keyboard_check_pressed(vk_tab)) {
    	obj_player.can_move = true;
    	draw_gui = false;
        global.menu = false;
    }
    var x1 = gui_x;
    var y1 = gui_y;
    var x2 = x1 + 100;
    var y2 = y1 + 100;
    
    draw_set_colour(c_black);
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_colour(c_red);
    draw_rectangle(x1, y1, x2, y2, true);
}