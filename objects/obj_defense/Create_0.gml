image_speed = 0;

//yep bois we are NOT making ts a function
var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;
    
var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;

cx = x + lengthdir_x(_dist, _dir);
cy = y + lengthdir_y(_dist, _dir);

max_hp = 100;

boards = undefined; //giving ts boards even though there's no boards because i can't code and if i give it boards it fixes le problem
//did the same shit for doors

key = "door_" + string(room) + "_" + string(x) + "_" + string(y);

if (struct_exists(global.data, key)) { //epic copy and paste
	data = global.data[$ key];
}
else {
	data = {
        broken: false,
        hp: max_hp
    }
}

broken = data.broken;
hp = data.hp;

gain_delay_max = 30;
gain_delay = gain_delay_max;

hp_gain = 10;

image_index = 1;

if (!broken) {
    image_index = 0;
	array_push(global.closed_obstacles, id);
    array_push(global.breakable_obstacles, id);
}