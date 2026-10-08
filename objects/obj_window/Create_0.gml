image_speed = 0;

key = "window_" + string(room) + "_" + string(x) + "_" + string(y);

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
}
else {
	data = {
        hp: irandom_range(5, 15),
        broken: choose(true, false),
        boards: choose(true, false)
    }
}

hp = data.hp;
broken = data.broken;
boards = data.boards;

ahp = hp; //actual hp
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


switch (boards) {
    case false:
        if (broken) {
            image_index = 2;
        }
        else{
            array_push(global.closed_obstacles, id);
            array_push(global.breakable_obstacles, id);
            image_index = 0;
        }
        break;
    case true:
        ahp = hp;
        hp += 50;
        array_push(global.opaque_obstacles, id);
        array_push(global.closed_obstacles, id);
        array_push(global.breakable_obstacles, id);
        if (broken) {
            image_index = 3;
        }
        else{
            image_index = 1;
        }
        break;
}