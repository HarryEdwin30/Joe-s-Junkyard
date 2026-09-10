var cam = view_camera[0];
    
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

var cam_low = 20;
var cam_high_x = 660;
var cam_high_y = 500;

if global.zoomed_in = true{
    cam_high_x /= 2;
    cam_high_y /= 2;
}

if (x > cam_x - cam_low and x < cam_x + cam_high_x) and (y > cam_y - cam_low and y < cam_y + cam_high_y){
    draw_self()
}

if global.player_alive = false{
    image_alpha = 1;
    exit;
}

var tm_obstacles = [];
if layer_exists("obstacles"){
    array_push(tm_obstacles, layer_tilemap_get_id("obstacles"));
}
if instance_exists(obj_door){
    var door = instance_nearest(x, y, obj_door);
    if door.door_open = false{
        if !place_meeting(x, y, door){
            array_push(tm_obstacles, door);
        }
    }
}

if !collision_line(x, y, obj_player.x, obj_player.y, tm_obstacles, false, undefined){
    image_alpha = 1;
}
else if image_alpha > 0 image_alpha -= 0.01;