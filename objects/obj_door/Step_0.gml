if hp <= 0{
    instance_destroy();
}

var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;

var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;

var cx = x + lengthdir_x(_dist, _dir);
var cy = y + lengthdir_y(_dist, _dir);

var dfd = point_distance(obj_player.x, obj_player.y, cx, cy);

if keyboard_check_pressed(ord("E")) and dfd <= 32{
    if open = false{
        open = true;
    }
    else{
        open = false;
    }
}

image_index = 0;
if open = true{
    image_index = 1;
}