if global.player_alive = false exit;

var weapon_to_draw = undefined;
var weapon_rotation = point_direction(obj_player.x + 5, obj_player.y, mouse_x, mouse_y);
var image_y_scale = 1;

if obj_player.image_xscale = -1 gun_x_distance_from_player = 8;
    else gun_x_distance_from_player = -8;

if weapon_rotation < 270{
    image_y_scale = -1;
}
    
if weapon_rotation < 90{
    image_y_scale = 1;
}
    
if weapon_type = 0 exit;

if weapon_type = 1 weapon_to_draw = spr_rev;
    
if weapon_type = 3 weapon_to_draw = spr_rif;

draw_sprite_ext(weapon_to_draw, -1, gun_start_x, gun_start_y, 1, image_y_scale, weapon_rotation, c_white, 1);

if draw_a_bullet = true{
    var tilemap = layer_tilemap_get_id("obstacles");
    var targets = [tilemap, obj_zombie_parent];
    var start_x = obj_player.x;
    var start_y = obj_player.y;
    var checker_x = start_x;
    var checker_y = start_y;
    var point_x = mouse_x;
    var point_y = mouse_y;
    var dir = point_direction(start_x, start_y, point_x, point_y);
    var max_distance = point_distance(start_x, start_y, point_x, point_y);
    
    var step_x = lengthdir_x(1, dir);
    var step_y = lengthdir_y(1, dir);
    
    while (position_meeting(checker_x, checker_y, targets) == 0 and point_distance(start_x, start_y, checker_x, checker_y) < max_distance) {
    	checker_x += step_x;
        checker_y += step_y;
    }
    
    var end_x = checker_x;
    var end_y = checker_y;
    
    draw_line_colour(gun_start_x, gun_start_y, end_x, end_y, c_yellow, c_yellow);
    draw_a_bullet_delay -= 1;
    if draw_a_bullet_delay <= 0{
        draw_a_bullet = false;
        draw_a_bullet_delay = draw_a_bullet_delay_max;
    }
}