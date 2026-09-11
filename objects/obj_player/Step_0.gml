if hp <= 0{
    instance_destroy(obj_backpack);
    instance_create_depth(x, y, 0, obj_death_marker);
    global.being_attacked = false;
    global.survivors_left -= 1;
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

if is_running = true and (keyboard_check(ord("D")) or keyboard_check(ord("A")) or keyboard_check(ord("S")) or keyboard_check(ord("W"))){
    stamina -= 1;
}
if is_running = false and !keyboard_check(vk_shift) stamina += 1;

global.push_cooldown -= 1;
if global.push_cooldown < 0 global.push_cooldown = 0;

if place_meeting(x, y, obj_zombie_parent) and global.godmode = false{
    def_m_spd = 0.5;
    can_run = false;
}
else{
    def_m_spd = 1;
    can_run = true;
}


if global.being_attacked = true{
    getoffme(60, ord("E"));
    exit;
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

var tilemaps = [];
    
if layer_exists("obstacles"){ 
    array_push(tilemaps, layer_tilemap_get_id("obstacles"));
}
if instance_exists(obj_window){
    var window = instance_nearest(x, y, obj_window);
    array_push(tilemaps, layer_tilemap_get_id("windows"));
}
if instance_exists(obj_door){
    var door = instance_nearest(x, y, obj_door);
    if door.door_open = false{
        if !place_meeting(x, y, door){
           array_push(tilemaps, door); 
        }
    }
}

if can_move = true{
    move_and_collide(h * m_spd, v * m_spd, tilemaps, undefined, undefined, undefined, m_spd, m_spd);
}