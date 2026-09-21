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
    draw_self();
    if global.player_alive{
        if !collision_line(x, y, obj_player.x, obj_player.y, global.opaque_obstacles, false, undefined){
            image_alpha = 1;
        }
        else if image_alpha > 0 image_alpha -= 0.01;
    }
    else {
    	image_alpha = 1;
    }
    if (global.see_all) {
    	image_alpha = 1;
    }
};