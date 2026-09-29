bs = 0;
scrap = 0;
rev_ammo = 0;
sho_ammo = 0;
rif_ammo = 0;
zev_cakes = 0;
draw_gui = false;

obj_x = 390;
obj_y = 148;

draw_take_options = false;

bs_tamount = 0;
scrap_tamount = 0;
rev_tamount = 0;
sho_tamount = 0;
rif_tamount = 0;
zc_tamount = 0;

drop_rapid_delay_max = 15;
drop_rapid_delay = drop_rapid_delay_max;
time_between_rapid_drops_max = 3;
time_between_rapid_drops = time_between_rapid_drops_max;

rx1 = 100;
ry1 = 140;
rx2 = 530;
ry2 = 340;

draw_outline = false;

var xo = (sprite_width / 2 + sprite_get_xoffset(image_index)) * image_xscale;
var yo = (sprite_height / 2 + sprite_get_yoffset(image_index)) * image_yscale;

var dist = point_distance(0, 0, xo, yo);
var dir = point_direction(0, 0, xo, yo) + image_angle; //we don't need to add the image angle because the sprite is a square, but i'm gonna do it anyway (:

cx = lengthdir_x(dist, dir) + x;
cy = lengthdir_y(dist, dir) + y;