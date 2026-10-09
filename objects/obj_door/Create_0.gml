image_speed = 0;

key = "door_" + string(room) + "_" + string(x) + "_" + string(y);

boards = undefined;

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
}
else {
	data = {
        open: choose(false, true),
        broken: choose(true, false),
        hp: irandom_range(50, 100)
    }
}

open = data.open;
broken = data.broken;
hp = data.hp;

if open{
    image_index = 1;
}
else{
    image_index = 0;
    array_push(global.closed_obstacles, id);
    array_push(global.breakable_obstacles, id);
    array_push(global.opaque_obstacles, id);
}
if (broken) {
	open = true;
    image_index = 2;
    hp = 0;
    var index1 = array_get_index(global.closed_obstacles, id);
    var index2 = array_get_index(global.breakable_obstacles, id);
    var index3 = array_get_index(global.opaque_obstacles, id);
    array_delete(global.closed_obstacles, index1, 1);
    array_delete(global.breakable_obstacles, index2, 1);
    array_delete(global.opaque_obstacles, index3, 1);
}

var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;
    
var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;

cx = x + lengthdir_x(_dist, _dir);
cy = y + lengthdir_y(_dist, _dir);