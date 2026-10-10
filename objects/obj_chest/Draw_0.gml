draw_self();

if (draw_outline) {
    draw_set_colour(c_red);
	draw_rectangle(x, y, x + sprite_width + 1, y + sprite_height + 1, true);
}