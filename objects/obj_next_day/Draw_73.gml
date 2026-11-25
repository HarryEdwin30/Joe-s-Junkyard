if (draw_outline) {
	draw_set_colour(c_red);
    var x1 = x;
    var y1 = y;
    var x2 = x1 + sprite_width;
    var y2 = y1 + sprite_height;
    draw_rectangle(x1, y1, x2, y2, true);
}