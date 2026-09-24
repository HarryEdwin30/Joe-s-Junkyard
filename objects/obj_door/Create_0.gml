key = "door_" + string(room) + "_" + string(x) + "_" + string(y);

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
}
else {
	data = {
        open: choose(false, true),
        broken: choose(true, false),
        played_broken_sound: false,
        hp: irandom_range(50, 100)
    }
}

open = data.open;
broken = data.broken;
played_broken_sound = data.played_broken_sound;
hp = data.hp;

if (broken) {
	played_broken_sound = true;
}
if (broken) {
	hp = 0;
}
boards = undefined;
var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;
    
var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;

cx = x + lengthdir_x(_dist, _dir);
cy = y + lengthdir_y(_dist, _dir);

added_to_array = false;