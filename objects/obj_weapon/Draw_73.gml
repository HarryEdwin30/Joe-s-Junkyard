if global.player_alive = false exit;

var weapon_to_draw = undefined;
var weapon_rotation = point_direction(obj_player.x + 5, obj_player.y, mouse_x, mouse_y);
var image_y_scale = 1;
var gun_x_distance_from_player = 8;
var gun_y_distance_from_player = 3;

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

draw_sprite_ext(weapon_to_draw, -1, obj_player.x + gun_x_distance_from_player, obj_player.y + gun_y_distance_from_player, 1, image_y_scale, weapon_rotation, c_white, 1);

if draw_a_bullet = true{
    draw_line_colour(obj_player.x + gun_x_distance_from_player, obj_player.y + gun_y_distance_from_player, mouse_x, mouse_y, c_yellow, c_yellow);
    draw_a_bullet_delay -= 1;
    if draw_a_bullet_delay <= 0{
        draw_a_bullet = false;
        draw_a_bullet_delay = draw_a_bullet_delay_max;
    }
}