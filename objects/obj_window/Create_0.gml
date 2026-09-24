key = "window_" + string(room) + "_" + string(x) + "_" + string(y);

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
}
else {
	data = {
        hp: irandom_range(5, 15),
        open: false,
        broken: choose(true, false),
        played_broken_sound: false,
        boards: choose(true, false)
    }
}

hp = data.hp;
open = data.open;
broken = data.broken;
played_broken_sound = data.played_broken_sound;
boards = data.boards;

given_board_hp = false;

ahp = hp; //actual hp
sound_delay = 5;
if (broken) {
	played_broken_sound = true;
}
board_delay_max = 60;
board_delay = board_delay_max;
reset = true;
bhptgb = 0; //board hp to give back
var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;

var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;

cx = x + lengthdir_x(_dist, _dir);
cy = y + lengthdir_y(_dist, _dir);
added_to_array = false;