if (pathfind_delay > 0) {
	pathfind_delay -= 1;
}
else {
    if (instance_exists(obj_zombie_parent)) {
        var zombie = instance_nearest(x, y, obj_zombie_parent);
        var xx = 0;
        var yy = 0;
        
        var sd = 0; //scary distance
        
        if (point_distance(x, y, zombie.x, zombie.y) < dr) {
            sd = dr;
            
            var lax = 0; //large average x
            var lay = 0;
            var lzombies = 0;
            
            var sax = 0;
            var say = 0;
            var szombies = 0;
            
            with (obj_zombie_parent) {
                if (point_distance(x, y, other.x, other.y) < other.dr) {
                    if (point_distance(x, y, other.x, other.y) < other.cdr) {
                    	sax += x;
                        say += y;
                        szombies += 1;
                    }
                    lax += x;
                    lay += y;
                    lzombies += 1;
                }
            }
            
            lax /= lzombies;
            lay /= lzombies;
            
            if (szombies > 0) {
                sd = cdr;
                sax /= szombies;
                say /= szombies;
                xx = sax;
                yy = say;
                pathfind_delay_max = 3;
            }
            else {
            	xx = lax;
                yy = lay;
                pathfind_delay_max = pathfind_delay_max_def;
            }
            
            
            
	        if (point_distance(x, y, xx, yy) < sd and pathfind_delay <= 0 and !collision_line(x, y, zombie.x, zombie.y, global.opaque_obstacles, false, true)) {
                var dang = 360 / 8;
                var rad = 0;
                var max_rad = 300;
                var tx = 0;
                var ty = 0;
                var cx = 0;
                var cy = 0;
                var found = false;
                while (!found and rad < max_rad) {
                	for (var ang = 0; ang < 360; ang += dang) {
                    	cx = x + lengthdir_x(rad, ang);
                        cy = y + lengthdir_y(rad, ang);
                        if (!place_meeting(cx, cy, global.closed_obstacles) and !place_meeting(cx, cy, obj_zombie_parent) and point_in_rectangle(cx, cy, 0, 0, room_width, room_height)) {
                        	if (point_distance(cx, cy, xx, yy) > sd) {
                            	found = true;
                                break;
                            }
                        }
                    }
                    rad += 30;
                }
                tx = cx;
                ty = cy;
                iwillfindyouandiwillrapeyou(tx, ty, m_spd);
            }
        }
    }
    pathfind_delay = pathfind_delay_max;
}

var tilemap = undefined;
if layer_exists("obstacles"){
    tilemap = layer_tilemap_get_id("obstacles");
}

if place_meeting(x, y, tilemap){
    var current_tile = 0;
    
    var _tile = tilemap_get_at_pixel(tilemap, x, y);
    
    if (_tile != 0) {
        current_tile = _tile;
    }
    
    if (current_tile != 0) {
        var test_x = x;
        var test_y = y;
        var radius = 2;
        var max_radius = 32;
        var found = false;
    
        while (!found && radius < max_radius) {
            for (var angle = 0; angle < 360; angle += 45) {
                var check_x = x + lengthdir_x(radius, angle);
                var check_y = y + lengthdir_y(radius, angle);
                
                var _is_empty = true;
                if (tilemap_get_at_pixel(tilemap, check_x, check_y) != 0) {
                    _is_empty = false;
                }
                
                if (_is_empty) {
                    test_x = check_x;
                    test_y = check_y;
                    found = true;
                    break;
                }
            }
            radius += 4;
        }
        
        if (found) {
            x = test_x;
            y = test_y;
        }
    }
}