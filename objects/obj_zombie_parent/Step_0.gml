if hp <= 0 instance_destroy()
    
if !instance_exists(obj_player){
    path_end();
    m_spd = 0;
    move_towards_point(x, y, m_spd);
    exit;
}

var push_speed = 1;
with (obj_zombie_parent) {
    if (id != other.id) {
        var dist = point_distance(x, y, other.x, other.y);
        var min_dist = 13;
        
        if (dist < min_dist && dist > 0) {
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


if global.survivors_left <= 0{
    m_spd = 0;
    move_towards_point(x, y, m_spd);
}
else{
    target_x = instance_nearest(x, y, obj_human_parent).x
    target_y = instance_nearest(x, y, obj_human_parent).y
    
    iwillfindyouandiwillrapeyou(target_x, target_y, m_spd);
}