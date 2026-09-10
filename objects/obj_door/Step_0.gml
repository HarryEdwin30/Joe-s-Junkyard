if hp <= 0{
    instance_destroy();
}

var cx = x + (sprite_width / 2); //c stands for center
var cy = y + (sprite_height / 2);

var dfd = point_distance(obj_player.x, obj_player.y, cx, cy);

if keyboard_check_pressed(ord("E")) and dfd <= 32{
    if door_open = false{
        door_open = true;
    }
    else{
        door_open = false;
    }
}

image_index = 0;
if door_open = true{
    image_index = 1;
}