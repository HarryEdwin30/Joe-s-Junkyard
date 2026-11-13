if !instance_exists(obj_player) or global.pause exit;

draw_set_colour(c_red);
var weapon_to_draw = undefined;
var weapon_rotation = point_direction(obj_player.x + 5, obj_player.y, mouse_x, mouse_y);
var image_x_scale = 1;
var image_y_scale = 1;

if obj_player.image_xscale = -1{
    gun_x_distance_from_player = 8;
    image_x_scale = 1;
}
else{
    gun_x_distance_from_player = -8;
    image_x_scale = -1;
}

if weapon_rotation < 270{
    image_y_scale = -1;
}
    
if weapon_rotation < 90{
    image_y_scale = 1;
}
    
if weapon_type = 0 exit;

if weapon_type = 1 weapon_to_draw = spr_rev;
    
if weapon_type = 2 weapon_to_draw = spr_sho;
    
if weapon_type = 3 weapon_to_draw = spr_rif;
    
if weapon_type = 4 weapon_to_draw = spr_ham;

if weapon_type != 0 and weapon_type != 4{
    draw_sprite_ext(weapon_to_draw, -1, gun_start_x, gun_start_y, 1, image_y_scale, weapon_rotation, c_white, 1);
}

if weapon_type = 4{
    draw_sprite_ext(weapon_to_draw, -1, gun_start_x, gun_start_y, image_x_scale, 1, 0, c_white, 1);
}

if (array_length(bullet_points) > 0) {
    for (var i = 0; i < array_length(bullet_points); i++) {
    	var end_x = bullet_points[i].px; //yes this is relatively new so that's why this is the only thing in here i did relatively well
        var end_y = bullet_points[i].py;
        
        draw_line_colour(gun_start_x, gun_start_y, end_x, end_y, c_yellow, c_yellow);
    }
    bullet_points = [];
}

if weapon_type = 2 and obj_player.can_move = true{
    var zone_size = point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) * 0.1;
    draw_rectangle(mouse_x - zone_size, mouse_y + zone_size, mouse_x + zone_size, mouse_y - zone_size, true);
}
if ham_draw_target = true and obj_player.can_move = true{
    if (ham_target.object_index == obj_zombie_parent || object_is_ancestor(ham_target.object_index, obj_zombie_parent)){
        draw_rectangle(ham_target.x - 8, ham_target.y + 8, ham_target.x + 8, ham_target.y - 8, true);
    }
    if (ham_target.object_index == obj_window || object_is_ancestor(ham_target.object_index, obj_window)){
        var spr = ham_target.sprite_index;
        var _center_x_offset = (sprite_get_width(spr) / 2 - sprite_get_xoffset(spr)) * ham_target.image_xscale;
        var _center_y_offset = (sprite_get_height(spr) / 2 - sprite_get_yoffset(spr)) * ham_target.image_yscale;
        
        var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
        var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + ham_target.image_angle;
        
        var cx = ham_target.x + lengthdir_x(_dist, _dir);
        var cy = ham_target.y + lengthdir_y(_dist, _dir);
        
        var ang = round(ham_target.image_angle) % 360;
        
        if (ang == 90 || ang == -90 || ang == 270) {
        	draw_rectangle(cx - 8, cy - 16, cx + 9, cy + 16, true);
        }
        else{
            draw_rectangle(cx - 16, cy - 8, cx + 16, cy + 9, true);
        }
    }
}