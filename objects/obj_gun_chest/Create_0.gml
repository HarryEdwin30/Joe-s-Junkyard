key = "gunchest_" + string(room) + "_" + string(x) + "_" + string(y);

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
}
else {
	data = {
        iexist: false,
        gun: undefined,
        opened: false
    }
}

iexist = data.iexist;
gun = data.gun;
opened = data.opened;

var xo = (sprite_width / 2 + sprite_get_xoffset(image_index)) * image_xscale;
var yo = (sprite_height / 2 + sprite_get_yoffset(image_index)) * image_yscale;

var dist = point_distance(0, 0, xo, yo);
var dir = point_direction(0, 0, xo, yo) + image_angle; //we don't need to add the image angle because the sprite is a square, but i'm gonna do it anyway (:

cx = lengthdir_x(dist, dir) + x;
cy = lengthdir_y(dist, dir) + y;

draw_outline = false;