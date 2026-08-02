var cam = view_camera[0];

var zoom_speed = 1.5;

var width = camera_get_view_width(cam) * zoom_speed;
var height = camera_get_view_height(cam) * zoom_speed;

width = round(width);
height = round(height);

var max_w = 640;
var max_h = 480;

if width > max_w width = max_w;
    
if height > max_h height = max_h;

camera_set_view_size(cam, width, height);