if hp <= 0 instance_destroy();
    
if !instance_exists(obj_player){
    path_end();
    m_spd = 0;
    move_towards_point(x, y, m_spd);
    exit;
}

var tilemap = layer_tilemap_get_id("obstacles");

var push_speed = 1;
if !place_meeting(x, y, tilemap){
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

if place_meeting(x, y, obj_human_parent) and stunned <= 0{
    m_spd = 0;
    global.being_attacked = true;
    if damage_delay <= 0{
        damage_delay = 50;
        sound = choose(bitesound1, bitesound2, bitesound3, bitesound4);
        deal_damage(25, sound, obj_human_parent);
        obj_human_parent.infected = true;
    }
}

var detection_range = 480;

if distance_to_object(obj_player) < detection_range and !collision_line(x, y, obj_player.x, obj_player.y, tilemap, true, undefined){
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
    show_debug_message("I can't find you!" + string(interest));
}

if interest <= 0{
    chase_player = false;
    interest = 0;
}
    
if chase_player = true{
    iwillfindyouandiwillrapeyou(target_x, target_y, m_spd);
    wandering = false;
}

//wandering shit starts here

if chase_player = false and wandering = false{
    var wander_distance = 250;
    wander_x = irandom_range(x - wander_distance, x + wander_distance);
    wander_y = irandom_range(y - wander_distance, y + wander_distance);
    
    if wander_x < 0  or wander_x > room_width or wander_y < 0 or wander_y > room_height or position_meeting(wander_x, wander_y, tilemap){
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
    iwillfindyouandiwillrapeyou(wander_x, wander_y, m_spd);
    wander_delay -= 1;
}