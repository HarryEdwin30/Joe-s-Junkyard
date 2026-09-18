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
}