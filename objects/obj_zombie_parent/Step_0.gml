if hp <= 0 instance_destroy();
    

if global.draw_esc_menu_gui = true{
    path_end();
    m_spd = 0;
    exit;
}

var tilemaps = [];
var tm_obstacles = [];
    
if layer_exists("obstacles"){
    array_push(tilemaps, layer_tilemap_get_id("obstacles"));
    array_push(tm_obstacles, layer_tilemap_get_id("obstacles"));
}
if layer_exists("windows"){
    array_push(tilemaps, layer_tilemap_get_id("windows"));
}

if distance_to_object(obj_player) > 1280 and global.player_alive = true{
    var sz = instance_position(x, y, obj_sz_parent);
    if sz != noone{
       sz.zia += 1; 
    }
    instance_destroy();
}
    
if !instance_exists(obj_player){
    path_end();
    m_spd = 0;
    move_towards_point(x, y, m_spd);
    exit;
}

//wall collisions in case zombie somehow gets stuck in one
var current_tile = 0;

for (var i = 0; i < array_length(tilemaps); i++) {
    var _map_id = tilemaps[i];
    var _tile = tilemap_get_at_pixel(_map_id, x, y);
    
    if (_tile != 0) {
        current_tile = _tile;
        break;
    }
}

if (current_tile != 0) {
    var test_x = x;
    var test_y = y;
    var radius = 2;
    var max_radius = 128;
    var found = false;

    while (!found && radius < max_radius) {
        for (var angle = 0; angle < 360; angle += 45) {
            var check_x = x + lengthdir_x(radius, angle);
            var check_y = y + lengthdir_y(radius, angle);
            
            var _is_empty = true;
            for (var j = 0; j < array_length(tilemaps); j++) {
                if (tilemap_get_at_pixel(tilemaps[j], check_x, check_y) != 0) {
                    _is_empty = false;
                    break;
                }
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

var cam = view_camera[0];
    
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

var pathfinding_delay_def = 8;
var pathfinding_delay_max = pathfinding_delay_def;

//collisions with other zombies
var push_speed = 2;
if !place_meeting(x, y, tilemaps){
    var cam_low = 20;
    var cam_high_x = 660;
    var cam_high_y = 500;
    var collision_delay_def = 0;
    var collision_delay_max = collision_delay_def;
        
    collision_delay -= 1;
    if collision_delay <= 0{
        collision_delay = collision_delay_max;
        with (obj_zombie_parent){
            if (id != other.id){ 
                var dist = point_distance(x, y, other.x, other.y);
                var min_dist = 16;
                
                if (dist < min_dist && dist > 0){
                    var dir = point_direction(x, y, other.x, other.y);
                    other.x += lengthdir_x(push_speed, dir);
                    other.y += lengthdir_y(push_speed, dir);
                }
            }
        }
    }
}

with (obj_player){
    if (id != other.id){
        var dist = point_distance(x, y, other.x, other.y);
        var min_dist = 12;
        
        if (dist < min_dist && dist > 0){
            var dir = point_direction(x, y, other.x, other.y);
            other.x += lengthdir_x(push_speed, dir);
            other.y += lengthdir_y(push_speed, dir);
        }
    }
}

if stunned > 0{
    stunned -= 1;
}
else m_spd = max_m_spd;

if global.being_attacked = true{
    damage_delay -= 1;
}
else damage_delay = 30;

if place_meeting(x, y, obj_human_parent) and stunned <= 0 and global.godmode = false{
    m_spd = 0;
    global.being_attacked = true;
    if damage_delay <= 0{
        damage_delay = 50;
        sound = choose(bitesound1, bitesound2, bitesound3, bitesound4);
        deal_damage(25, sound, obj_human_parent);
        obj_human_parent.infected = true;
    }
}

var detection_range = 320;

if global.invisible = true{
    detection_range = 0;
}

if distance_to_object(obj_player) < detection_range and !collision_line(x, y, obj_player.x, obj_player.y, tm_obstacles, false, undefined){
    can_see_player = true;
    interest = max_interest;
    target_x = instance_nearest(x, y, obj_human_parent).x;
    target_y = instance_nearest(x, y, obj_human_parent).y;
    search_zone_w = [target_x - 60, target_x + 60];
    search_zone_h = [target_y - 60, target_y + 60];
}
else{
    can_see_player = false;
}

if can_see_player = true{
    chase_player = true;
}

if can_see_player = false and chase_player = true and x >= search_zone_w[0] and x <= search_zone_w[1] and y >= search_zone_h[0] and y <= search_zone_h[1]{
    interest -= 1;
}

if interest <= 0{
    chase_player = false;
    interest = 0;
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
    
    if wander_x < 0  or wander_x > room_width or wander_y < 0 or wander_y > room_height or position_meeting(wander_x, wander_y, tilemaps){
        exit;
    } 
    else{
        wander_delay = irandom_range(180, 600);
        wandering = true;
    }
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