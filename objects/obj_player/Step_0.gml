audio_listener_position(x, y, 0);
audio_listener_orientation(0, 0, 1, 0, -1, 0);
if hp <= 0{
    instance_destroy(obj_backpack);
    instance_create_depth(x, y, 0, obj_death_marker);
    global.being_attacked = false;
    audio_play_sound(death, 0, false);
    if infected = true{
        global.showacutezombiepic = true;
        instance_create_depth(x, y, 0, obj_walker);
    }
    instance_destroy();
}

if global.draw_esc_menu_gui = true{
    exit;
}

if mouse_x > x{
    image_xscale = -1;
}
else image_xscale = 1;

if stamina > max_stamina stamina = max_stamina;
    
if stamina < 0 stamina = 0;

if !global.godmode and is_running = true and (keyboard_check(ord("D")) or keyboard_check(ord("A")) or keyboard_check(ord("S")) or keyboard_check(ord("W"))){
    stamina -= 0.2;
}
if is_running = false and !keyboard_check(vk_shift) stamina += 0.2;

if place_meeting(x, y, obj_zombie_parent) and global.godmode = false{
    def_m_spd = 0.5;
    can_run = false;
}
else{
    def_m_spd = 1;
    can_run = true;
}

if (push_cooldown > 0) {
	push_cooldown -= 1;
}

if being_attacked{
    if (keyboard_check_pressed(ord("E"))) and stamina >= 25 and push_cooldown <= 0{
        being_attacked = false;
        stamina -= 25;
    	audio_play_sound(bp_select, 0, false);
        var zombies = [];
        if (instance_exists(obj_zombie_parent)) {
        	with (obj_zombie_parent) {
            	if (place_meeting(x, y, obj_player)) {
                	id.stunned = 60;
                }
            }
        }
    }
}
var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if keyboard_check(vk_shift) and can_run = true is_running = true
    else {
    	is_running = false;
    }

if is_running = true and stamina > 0{
    m_spd = def_m_spd * 2;
}
else {
    m_spd = def_m_spd;
}

if (place_meeting(x, y, obj_window)) {
    var window = instance_nearest(x, y, obj_window);
    if (window.open) {
    	m_spd /= 2;
    }
}
var tilemap = layer_tilemap_get_id("obstacles");
var obstacles = [tilemap];
if (instance_exists(obj_door)) {
	var door = instance_nearest(x, y, obj_door);
    if !door.open and !place_meeting(x, y, door){
        array_push(obstacles, door);
    }
}
if (instance_exists(obj_window)) {
	var window = instance_nearest(x, y, obj_window);
    if !window.open and !place_meeting(x, y, window){
        array_push(obstacles, window);
    }
}
if (global.godmode) {
	m_spd *= 2;
}
if can_move = true and !being_attacked{
    move_and_collide(h * m_spd, v * m_spd, obstacles, undefined, undefined, undefined, m_spd, m_spd);
}