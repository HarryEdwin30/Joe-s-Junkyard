var cam = view_camera[0];

var zoom_speed = 1.5;

var width = camera_get_view_width(cam) / zoom_speed;
var height = camera_get_view_height(cam) / zoom_speed;

width = round(width);
height = round(height);

var min_w = 160;
var min_h = 120;

if width < min_w width = min_w;
    
if height < min_h height = min_h;

camera_set_view_size(cam, width, height);