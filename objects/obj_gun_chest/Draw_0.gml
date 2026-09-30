draw_self();
if instance_exists(obj_player) and !global.see_all{
    if !collision_line(x, y, obj_player.x, obj_player.y, global.opaque_obstacles, false, undefined){
        image_alpha = 1;
    }
    else if image_alpha > 0 image_alpha -= 0.01;
}
else {
    image_alpha = 1;
}
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