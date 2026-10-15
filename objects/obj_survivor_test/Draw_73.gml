if (show_pointer_pos) {
    var size = 10;
    
    var xx = pointer_x + size;
    var yy = pointer_y + size;
    
    var c = c_aqua;
    
	draw_rectangle_colour(pointer_x, pointer_y, xx, yy, c, c, c, c, false);
}

if (show_average_zombies) {
    if (instance_exists(obj_zombie_parent)) {
        var zombie = instance_nearest(x, y, obj_zombie_parent);
        if (point_distance(x, y, zombie.x, zombie.y) < dr) {
            var lax = 0; //large average x
            var lay = 0;
            var lzombies = 0;
            
            var _max = 0;
            var may = 0;
            var mzombies = 0;
            
            var sax = 0;
            var say = 0;
            var szombies = 0;
            
            with (obj_zombie_parent) {
                if (point_distance(x, y, other.x, other.y) < other.dr) {
                    if (point_distance(x, y, other.x, other.y) < other.mdr) {
                        if (point_distance(x, y, other.x, other.y) < other.cdr) {
                            sax += x;
                            say += y;
                            szombies += 1;
                        }
                        _max += x;
                        may += y;
                        mzombies += 1;
                    }
                    lax += x;
                    lay += y;
                    lzombies += 1;
                }
            }
            
            lax /= lzombies;
            lay /= lzombies;
            
            if (mzombies > 0) {
            	_max /= mzombies;
                may /= mzombies;
            }
            
            if (szombies > 0) {
                sax /= szombies;
                say /= szombies;
            }
            
            var size = 16;
            
            var lax2 = lax + size;
            var lay2 = lay + size;
            
            var max2 = _max + size;
            var may2 = may + size;
            
            var sax2 = sax + size;
            var say2 = say + size;
            
            var lc = c_lime;
            var mc = c_yellow;
            var cc = c_red;
            
            draw_rectangle_colour(lax, lay, lax2, lay2, lc, lc, lc, lc, false);
            draw_rectangle_colour(_max, may, max2, may2, mc, mc, mc, mc, false);
            draw_rectangle_colour(sax, say, sax2, say2, cc, cc, cc, cc, false);
        }
    }
}
if (draw_aim_line) {
    var c = c_aqua;
	draw_line_colour(x, y, line_x, line_y, c, c);
}
if (draw_bullet) {
	var c = c_yellow;
	draw_line_colour(gun_start_x, gun_start_y, line_x, line_y, c, c);
    draw_bullet = false;
}
if draw_sho_bullets = true{
    var array_number = 0;
    
    for (var p = 0; p < max_pellets; p++) {
        var end_x = pellet_points[array_number][0];
        var end_y = pellet_points[array_number][1];
        array_number += 1;
        draw_line_colour(gun_start_x, gun_start_y, end_x, end_y, c_yellow, c_yellow);
    }
    draw_sho_bullets = false;
    pellet_points = [];
}

var weapon_to_draw = undefined;
var weapon_rotation = point_direction(x + 5, y, pointer_x, pointer_y);
var image_x_scale = 1;
var image_y_scale = 1;

if image_xscale = -1{
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
    
if (!weapon = 0) {
    if weapon = 1 weapon_to_draw = spr_rev;
        
    if weapon = 2 weapon_to_draw = spr_sho;
        
    if weapon = 3 weapon_to_draw = spr_rif;
        
    if weapon = 4 weapon_to_draw = spr_ham;
    
    if weapon != 0 and weapon != 4{
        gun_start_x = x + gun_x_distance_from_player;
        gun_start_y = y + gun_y_distance_from_player;
        draw_sprite_ext(weapon_to_draw, -1, gun_start_x, gun_start_y, 1, image_y_scale, weapon_rotation, c_white, 1);
    }
}