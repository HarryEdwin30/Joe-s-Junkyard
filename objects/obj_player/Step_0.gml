if (global.pause) {
	exit;
}

if (hp < max_hp) {
	if (heal_delay > 0) {
    	heal_delay -= 1;
    }
    else {
    	if (hp + heal_amount > max_hp) {
        	hp = max_hp;
        }
        else {
        	hp += heal_amount
        }
        heal_delay = heal_delay_max;
    }
}

audio_listener_position(x, y, 0);
audio_listener_orientation(0, 0, 1, 0, -1, 0);

if hp <= 0{
    being_attacked = false;
    instance_destroy(obj_backpack);
    instance_destroy(obj_weapon);
    room_goto(DeathRoom);
    global.game_started = false;
    audio_stop_all();
    instance_destroy();
}

if mouse_x > x{
    image_xscale = -1;
}
else image_xscale = 1;

if stamina > max_stamina stamina = max_stamina;
    
if stamina < 0 stamina = 0;

if !global.godmode and stamina > 0 and is_running = true and (keyboard_check(ord("D")) or keyboard_check(ord("A")) or keyboard_check(ord("S")) or keyboard_check(ord("W"))){
    stamina -= 0.2;
}
if !is_running and !keyboard_check(vk_shift) stamina += 0.2;

if place_meeting(x, y, obj_zombie_parent) and global.godmode = false{
    def_m_spd = 0.5;
    can_run = false;
}
else{
    def_m_spd = 1;
    can_run = true;
    being_attacked = false;
}

if (keyboard_check(ord("D")) or keyboard_check(ord("A")) or keyboard_check(ord("S")) or keyboard_check(ord("W"))) {
	if (step_delay > 0) {
    	step_delay -= 1;
    } else {
        step_delay = step_delay_max
        var map = layer_tilemap_get_id("backgroundlayer");
        var mapdata = tilemap_get_at_pixel(map, x, y);
        var type = tile_get_index(mapdata);
        var sound = undefined;
        switch (type) {
        	case 1: //grass
                sound = choose(fs_grass1, fs_grass2, fs_grass3);
                break;
            case 2: //purple placeholder?
                break;
            case 3: //dirt
                sound = choose(fs_dirt1, fs_dirt2, fs_dirt3);
                break;
            case 4: //wood
                sound = choose(fs_wood1, fs_wood2, fs_wood3);
                break;
            case 5: //carpet
                break;
            case 6: //stone
                sound = choose(fs_stone1, fs_stone2, fs_stone3);
                break;
        }
        audio_play_sound(sound, 0, false);
    }
}

if (push_cooldown > 0) {
	push_cooldown -= 1;
}

if being_attacked{
    if (keyboard_check_pressed(vk_space)) and stamina >= 33 and push_cooldown <= 0{
        being_attacked = false;
    	audio_play_sound(bp_select, 0, false);
        var zombies = [];
        if (instance_exists(obj_zombie_parent)) {
        	with (obj_zombie_parent) {
            	if (place_meeting(x, y, obj_player)) {
                	array_push(zombies, id);
                }
            }
        }
        for (var i = 0; i < array_length(zombies); i++) {
        	stamina -= 33;
            if (stamina > 0) {
            	zombies[i].stunned = zombies[i].max_stun;
            }
        }
    }
}
var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if keyboard_check(vk_shift) and can_run = true is_running = true;
else {
    is_running = false;
}

if is_running = true and stamina > 0{
    m_spd = def_m_spd * 2;
    step_delay_max = step_delay_def / 2;
}
else {
    m_spd = def_m_spd;
    step_delay_max = step_delay_def;
}

if (place_meeting(x, y, obj_window)) {
    m_spd /= 2;
}
if (global.godmode) {
	m_spd *= 2;
}

var ponly_obs = layer_tilemap_get_id("player_only_obstacles");
var walls = [];
array_copy(walls, 0, global.closed_obstacles, 0, array_length(global.closed_obstacles));
array_push(walls, ponly_obs);

if can_move = true and !being_attacked{
    move_and_collide(h * m_spd, v * m_spd, walls, undefined, undefined, undefined, m_spd, m_spd);
}

if place_meeting(x, y, global.breakable_obstacles){
    var n_obs = noone;
    var _min_dist = infinity;
    
    for (var i = 0; i < array_length(global.breakable_obstacles); i++) {
        var _inst = global.breakable_obstacles[i];
        var _dist = point_distance(x, y, _inst.x, _inst.y);
        if (_dist < _min_dist) {
            _min_dist = _dist;
            n_obs = _inst;
        }
    }
    if (n_obs != noone) {
        m_spd = 0;
        wander_delay = 0;
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
                if (place_meeting(check_x, check_y, global.closed_obstacles)) {
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