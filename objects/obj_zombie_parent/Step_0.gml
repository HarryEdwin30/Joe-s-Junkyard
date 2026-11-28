if (global.pause or !instance_exists(obj_player)) {
    path_end();
	exit;
}

var last_dist = point_distance(x, y, last_x, last_y);

pixels_traveled -= last_dist;

last_x = x;
last_y = y;

if (pixels_traveled <= 0) {
	pixels_traveled = max_pixels_to_travel;
    max_pixels_to_travel = irandom_range(pixels_min, pixels_max);
    footstep_at();
}

audio_emitter_position(emitter, x, y, 0);

var play_sound = function(sound) {
    last_sound = sound;
    current_sound = audio_play_sound_on(emitter, sound, false, 0);
}

if (!audio_is_playing(current_sound)) {
    if (sound_delay > 0) {
    	sound_delay -= 1;
    } else {
        sound_delay = irandom_range(30, 80);
        var sound_pack = noone;
        var sound_bank = [];
        if (chase_player) {
            sound_pack = anger_sounds;
        } else {
            sound_pack = wander_sounds;
        }
        if (sound_pack != noone) {
            array_copy(sound_bank, 0, sound_pack, 0, array_length(sound_pack));
            if (array_contains(sound_bank, last_sound)) {
                var index = array_get_index(sound_bank, last_sound);
            	array_delete(sound_bank, index, 1);
            }
            var sound = arv(sound_bank);
            play_sound(sound);
        }
    }
}

if (hp < last_hp) {
    last_hp = hp;
	audio_stop_sound(current_sound);
    var sound_pack = hurt_sounds;
    var sound_bank = [];
    if (sound_pack != noone) {
        array_copy(sound_bank, 0, sound_pack, 0, array_length(sound_pack));
        if (array_contains(sound_bank, last_sound)) {
            var index = array_get_index(sound_bank, last_sound);
            array_delete(sound_bank, index, 1);
        }
    }
    var sound = arv(sound_bank);
    play_sound(sound);
}

if instance_exists(obj_player){
    var cam = view_camera[0];
    
    var camx1 = camera_get_view_x(cam);
    var camy1 = camera_get_view_y(cam);
    var camx2 = camera_get_view_x(cam) + camera_get_view_width(cam);
    var camy2 = camera_get_view_y(cam) + camera_get_view_height(cam);
    
    if (point_in_rectangle(x, y, camx1, camy1, camx2, camy2)) {
    	if !collision_line(x, y, obj_player.x, obj_player.y, global.opaque_obstacles, false, undefined) or global.see_all{
            image_alpha = 1;
        }
        else if image_alpha > 0{
            image_alpha -= 0.01;
        }
    }
    else if (image_alpha != 0){
    	image_alpha = 0;
    }
    if (instance_exists(obj_ai_director)) {
        var dist = 600;
        if (point_distance(x, y, obj_player.x, obj_player.y) > dist) {
            var zone = instance_nearest(x, y, obj_spawn_area);
            switch (object_index) {
            	case obj_walker:
                    zone.walkers += 1;
                    break;
                case obj_runner:
                    zone.runners += 1;
                    break;
            }
        	instance_destroy();
        }
    }
}

if hp <= 0 {
    audio_stop_sound(current_sound);
    instance_destroy();
}
    
var tilemap = undefined;
if layer_exists("obstacles"){
    tilemap = layer_tilemap_get_id("obstacles");
}

//wall collisions in case zombie somehow gets stuck in one
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
var cam = view_camera[0];
    
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

var pathfinding_delay_max = 15;

var push_speed = 4;

/* will i ever use this code?????????
if place_meeting(x, y, obj_player){
    with (obj_player){
        if (id != other.id){
            var dist = point_distance(x, y, other.x, other.y);
            var min_dist = 12;
            
            if (dist < min_dist && dist > 0){
                var dir = point_direction(x, y, other.x, other.y);
                var test_x = other.x + lengthdir_x(push_speed, dir);
                var test_y = other.y + lengthdir_y(push_speed, dir);
                if !place_meeting(test_x, test_y, global.closed_obstacles){
                    other.x += lengthdir_x(push_speed, dir);
                    other.y += lengthdir_y(push_speed, dir);
                }
            }
        }
    }
}
*/
if place_meeting(x, y, obj_zombie_parent) and !place_meeting(x, y, obj_player){
    if pathfinding_delay <= 0{
        with (obj_zombie_parent){ //maybe it would be better to compile all the zombies you are colliding with instead of running through all of them, but you know what whatever
            if (id != other.id){
                var dist = point_distance(x, y, other.x, other.y);
                var min_dist = 16;
                
                if (dist < min_dist && dist > 0){
                    var dir = point_direction(x, y, other.x, other.y);
                    var test_x = other.x + lengthdir_x(push_speed, dir);
                    var test_y = other.y + lengthdir_y(push_speed, dir);
                    if !place_meeting(test_x, test_y, global.closed_obstacles){
                        other.x += lengthdir_x(push_speed, dir);
                        other.y += lengthdir_y(push_speed, dir);
                    }
                }
            }
        }
    }
}

if stunned > 0{
    stunned -= 1;
}
else m_spd = max_m_spd;
    
if (place_meeting(x, y, obj_window)) {
    m_spd /= 2;
}
if (place_meeting(x, y, obj_prop_parent)) {
	m_spd /= 2;
}

var target = noone

var detection_range = 200;
if global.invisible = true{
    if (instance_exists(obj_survivor_test)) {
        target = instance_nearest(x, y, obj_survivor_test);
    }
}
else {
	target = instance_nearest(x, y, obj_human_parent);
}
if (target != noone) {
    if global.zombie_omniscience or distance_to_object(target) < detection_range and !collision_line(x, y, target.x, target.y, global.opaque_obstacles, false, true){
        can_see_player = true;
        var max_interest = irandom_range(600, 1000);
        interest = max_interest;
        target_x = target.x;
        target_y = target.y;
    }
    else{
        can_see_player = false;
    }
    if (place_meeting(x, y, target) and stunned <= 0) {
	    m_spd = 0;
        path_end()
        if (target.object_index = obj_player) {
        	obj_player.being_attacked = true;
        }
        if (damage_delay > 0) {
        	damage_delay -= 1;
        }
        else {
            target.infected = true;
            audio_stop_sound(current_sound);
            var sound_pack = attack_sounds;
            var sound_bank = [];
            if (sound_pack != noone) {
                array_copy(sound_bank, 0, sound_pack, 0, array_length(sound_pack));
                if (array_contains(sound_bank, last_sound)) {
                    var index = array_get_index(sound_bank, last_sound);
                	array_delete(sound_bank, index, 1);
                }
            }
            var sound = arv(sound_bank);
            play_sound(sound);
            deal_damage(10, undefined, target);
            damage_delay = damage_delay_max;
        }
    }
    else {
    	damage_delay = damage_delay_max;
    }
}
if can_see_player = true{
    chase_player = true;
}

if chase_player = true{
    if (notice_sound = false) {
        notice_sound = true;
        audio_stop_sound(current_sound);
        var sound_pack = anger_sounds;
        var sound_bank = [];
        if (sound_pack != noone) {
            array_copy(sound_bank, 0, sound_pack, 0, array_length(sound_pack));
            if (array_contains(sound_bank, last_sound)) {
                var index = array_get_index(sound_bank, last_sound);
                array_delete(sound_bank, index, 1);
            }
        }
        var sound = arv(sound_bank);
        play_sound(sound);
    }
    if (interest > 0) {
    	interest -= 1;
    }
    else {
    	chase_player = false;
    }
} else {
	notice_sound = false;
}
    
if chase_player = true{
    if pathfinding_delay <= 0{
        iwillfindyouandiwillrapeyou(target_x, target_y, m_spd);
        pathfinding_delay = pathfinding_delay_max;
    }
    pathfinding_delay -= 1;
    wandering = false;
}

//wandering shit starts here

if chase_player = false and wandering = false{
    var wander_distance = 250;
    wander_x = irandom_range(x - wander_distance, x + wander_distance);
    wander_y = irandom_range(y - wander_distance, y + wander_distance);
    
    if wander_x < 0  or wander_x > room_width or wander_y < 0 or wander_y > room_height or position_meeting(wander_x, wander_y, global.closed_obstacles){
        exit;
    } 
    else{
        wander_delay = irandom_range(180, 600);
        wandering = true;
    }
    wander_delay = irandom_range(180, 600);
    wandering = true;
}

if wander_delay <= 0{
    wandering = false;
}

if wandering = true{
    if pathfinding_delay <= 0{
        iwillfindyouandiwillrapeyou(wander_x, wander_y, m_spd);
        pathfinding_delay = pathfinding_delay_max;
    }
    pathfinding_delay -= 1;
    wander_delay -= 1;
}

//obstacle stuff down here (:
if place_meeting(x, y, global.breakable_obstacles){
    var n_obs = noone;
    var _min_dist = infinity;
    
    for (var i = 0; i < array_length(global.breakable_obstacles); i++) {
        var _inst = global.breakable_obstacles[i];
        if (instance_exists(_inst)) {
            var _dist = point_distance(x, y, _inst.x, _inst.y);
            if (_dist < _min_dist) {
                _min_dist = _dist;
                n_obs = _inst;
            }
        }
    }
    if (n_obs != noone) {
        if (!push_out_of_obstacle) {
            push_out_of_obstacle = true;
            m_spd = 0;
            wander_delay = 0;
            path_end();
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
                    if (position_meeting(check_x, check_y, n_obs)) {
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
        if (target != noone) {
            if (chase_player and collision_line(x, y, target.x, target.y, global.closed_obstacles, false, true)){
                breaking_something = true;
                if break_delay > 0{
                    break_delay -= 1;
                }
                else{
                    if (n_obs.boards = undefined) {
                    	var sound_to_play = choose(doorbang1, doorbang2);
                        deal_damage(1, sound_to_play, n_obs, x, y);
                        switch (object_index) {
                        	case obj_walker:
                                break_delay = irandom_range(60, 120);
                                break;
                            case obj_runner:
                                break_delay = irandom_range(25, 60);
                                break;
                        }
                    }
                    else if (n_obs.boards = false) {
                        var sound_to_play = choose(windowbang1, windowbang2);
                        deal_damage(1, sound_to_play, n_obs, x, y);
                        switch (object_index) {
                        	case obj_walker:
                                break_delay = irandom_range(60, 120);
                                break;
                            case obj_runner:
                                break_delay = irandom_range(25, 60);
                                break;
                        }
                    }
                    else{
                        var sound_to_play = choose(boardbang1, boardbang2);
                        deal_damage(1, sound_to_play, n_obs, x, y);
                        switch (object_index) {
                            case obj_walker:
                                break_delay = irandom_range(60, 120);
                                break;
                            case obj_runner:
                                break_delay = irandom_range(25, 60);
                                break;
                        }
                    }
                }
                m_spd = 0;
                path_end();
            }
        }
    }
}
else {
    push_out_of_obstacle = false;
	breaking_something = false;
}
if (collision_delay > 0) {
	collision_delay -= 1;
}