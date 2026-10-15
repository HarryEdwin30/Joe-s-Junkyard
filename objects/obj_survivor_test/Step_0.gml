//movement

if (pathfind_delay > 0) {
	pathfind_delay -= 1;
}
else {
    if (instance_exists(obj_zombie_parent)) {
        var zombie = instance_nearest(x, y, obj_zombie_parent);
        
        //fleeing
        
        var xx = 0;
        var yy = 0;
        
        var sd = 0; //scary distance
        
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
                if (!collision_line(x, y, other.x, other.y, global.opaque_obstacles, false, true)) {
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
            }
            
            if (mzombies > 0) {
                if (szombies > 0) {
                    sd = cdr;
                    sax /= szombies;
                    say /= szombies;
                    xx = sax;
                    yy = say;
                    pathfind_delay_max = 5;
                }
                else {
                	sd = mdr;
                    _max /= mzombies;
                    may /= mzombies;
                    xx = _max;
                    yy = may;
                    pathfind_delay_max = 10;
                }
            }
            else {
                sd = dr;
                lax /= lzombies;
                lay /= lzombies;
            	xx = lax;
                yy = lay;
                pathfind_delay_max = pathfind_delay_max_def;
            }
            
	        if (point_distance(x, y, xx, yy) < sd and pathfind_delay <= 0) {
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

//tilemap collision safety

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

//weapon

if (weapon = 1) {
	if (rev_reloading) {
        if weapon != 1{
            rev_reloading = false;
        }
        if rev_total_bullets <= 0{
            rev_reloading = false;
        }
        rev_reload_time_left -= 1;
        if rev_reload_time_left <= 0{
            if rev_bullets_left = rev_max_bullets{
                rev_reload_delay_left = 2;
            }
            if rev_reload_delay_left = 1{
                rev_bullets_left += 1;
                rev_total_bullets -= 1;
                audio_play_sound_at(bulletinsert, x, y, 0, 160, 320, 1, false, 0);
            }
            if rev_reload_delay_left = 0{
                rev_reload_delay_left = 1;
            }
            rev_reload_time_left = rev_max_reload_time;
        }
        if rev_reload_delay_left = 2{
            rev_reload_delay_left = 0;
            audio_play_sound_at(rev_reload_end, x, y, 0, 160, 320, 1, false, 0);
            rev_reloading = false;
        }
    }
    if (rev_bullets_left <= 0 and !rev_reloading and rev_total_bullets > 0) {
        rev_reloading = true;
        audio_play_sound_at(rev_reload_start, x, y, 0, 160, 320, 1, false, 0);
    }
}

if (instance_exists(obj_zombie_parent)) {
    var target = instance_nearest(x, y, obj_zombie_parent);
    var dist = point_distance(x, y, target.x, target.y);
    if (dist < dr and !collision_line(x, y, target.x, target.y, global.opaque_obstacles, false, true) and !place_meeting(x, y, obj_zombie_parent)) {
        var dir = point_direction(x, y, target.x, target.y);
        var dx = x + lengthdir_x(dist, dir);
        var dy = y + lengthdir_y(dist, dir);
        
        var dist_left = point_distance(pointer_x, pointer_y, target.x, target.y);
        var pdist = (dist_left / dist) * 10;
        var aim_speed = def_aim_speed * pdist;
        
        if (pointer_x < dx) {
        	pointer_x += aim_speed;
        }
        else if (pointer_x > dx) {
        	pointer_x -= aim_speed;
        }
        if (pointer_y < dy) {
        	pointer_y += aim_speed;
        }
        else if (pointer_y > dy) {
        	pointer_y -= aim_speed;
        }
        
        var cx = x;
        var cy = y;
        var dir2 = point_direction(x, y, pointer_x, pointer_y);
        var sx = lengthdir_x(1, dir2);
        var sy = lengthdir_y(1, dir2);
        var max_dist = point_distance(x, y, pointer_x, pointer_y);
        var tdist = 0;
        
        while (!position_meeting(cx, cy, target) and tdist < max_dist) {
        	cx += sx;
            cy += sy;
            tdist += 1;
        }
        line_x = cx;
        line_y = cy;
        
        if (weapon = 1) {
            if (rev_shoot_delay > 0) {
                rev_shoot_delay -= 1;
            }
            else {
                rev_shoot_delay = irandom_range(rev_shoot_delay_min, rev_shoot_delay_max);
                if (rev_bullets_left > 0 and !rev_reloading and collision_line(x, y, line_x, line_y, target, false, true)) {
                    draw_bullet = true;
                    rev_bullets_left -= 1;
                    audio_play_sound_at(rev_gunshot1, x, y, 0, 160, 1000, 1, false, 0);
                    if instance_exists(obj_zombie_parent){
                        obj_zombie_parent.target_x = x;
                        obj_zombie_parent.target_y = y;
                        obj_zombie_parent.search_zone_w = [obj_zombie_parent.target_x - 60, obj_zombie_parent.target_x + 60];
                        obj_zombie_parent.search_zone_h = [obj_zombie_parent.target_y - 60, obj_zombie_parent.target_y + 60];
                        obj_zombie_parent.chase_player = true;
                        obj_zombie_parent.interest = obj_zombie_parent.max_interest;
                    }
                    var bcx = x;
                    var bcy = y;
                    var bdir = point_direction(x, y, pointer_x, pointer_y);
                    var bsx = lengthdir_x(1, bdir);
                    var bsy = lengthdir_y(1, bdir);
                    var bmax_dist = point_distance(x, y, pointer_x, pointer_y);
                    var btdist = 0;
                    while (btdist < bmax_dist) {
                        bcx += bsx;
                        bcy += bsy;
                        btdist += 1;
                        if (position_meeting(bcx, bcy, obj_window)) {
                            var window_to_shoot = instance_nearest(bcx, bcy, obj_window);
                            if (!window_to_shoot.broken) {
                                var wsound_to_play = choose(windowbreak1, windowbreak2, windowbreak3);
                                audio_play_sound_at(wsound_to_play, window_to_shoot.x, window_to_shoot.y, 0, 160, 480, 1, false, 0);
                                window_to_shoot.broken = true;
                                if (window_to_shoot.boards) {
                                window_to_shoot.image_index = 3;
                                }
                                else {
                                    window_to_shoot.image_index = 2;
                                    var index1 = array_get_index(global.closed_obstacles, window_to_shoot);
                                    var index2 = array_get_index(global.breakable_obstacles, window_to_shoot);
                                    array_delete(global.closed_obstacles, index1, 1);
                                    array_delete(global.breakable_obstacles, index2, 1);
                                }
                            }
                        }
                        if (position_meeting(bcx, bcy, global.opaque_obstacles)) {
                            break;
                        }
                        if (position_meeting(bcx, bcy, obj_zombie_parent)) {
                            var bzombie = noone;
                            bzombie = instance_nearest(bcx, bcy, obj_zombie_parent);
                            if (bzombie != noone) {
                                var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
                                deal_damage(rev_damage, sound_to_play, bzombie, bzombie.x, bzombie.y);
                            }
                            break;
                        };
                    }
                }
            }
        }
    }
    else {
    	draw_aim_line = false;
    }
}
if pointer_x > x{
    image_xscale = -1;
}
else image_xscale = 1;