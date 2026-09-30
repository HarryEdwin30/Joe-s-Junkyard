draw_self();
if (draw_outline) {
    var ang = round(image_angle) % 360;
    draw_set_colour(c_red);
	if (ang == 90 || ang == -90 || ang == 270) {
        draw_rectangle(cx - 8, cy - 16, cx + 9, cy + 16, true);
    }
    else{
        draw_rectangle(cx - 16, cy - 8, cx + 16, cy + 9, true);
    }
}