mx = 320;
my = 240;

image_speed = 0;

//yep bois we are NOT making ts a function
var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;
    
var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;

cx = x + lengthdir_x(_dist, _dir);
cy = y + lengthdir_y(_dist, _dir);

max_hp = 300;

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

php = get_percent(hp, max_hp, 100);

gain_delay_max = 30;
gain_delay = gain_delay_max;

hp_gain = 10;
scrap_cost = hp_gain;

image_index = 1;

if (!broken) {
    image_index = 0;
	array_push(global.closed_obstacles, id);
    array_push(global.breakable_obstacles, id);
}

draw_my_health = function(dx, dir) {
    var xx = mx + dx;
    var yy = 2;
    
    var x1 = xx;
    var y1 = yy + 22;
    var x2 = x1 + 50;
    var y2 = y1 + 10;
    
    var bc = c_red;
    var minc = c_lime;
    var maxc = c_lime;
    
    draw_set_colour(c_red);
    
    draw_text(xx, yy, dir);
    
    draw_healthbar(x1, y1, x2, y2, php, bc, minc, maxc, 0, true, true);
}