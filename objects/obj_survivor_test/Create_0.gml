/*
 * todo in order:
 * 
 * player squad joining - got it!
 * 
 * collision with doors/windows and breaking of them - got it!
 * 
 * PvE and EvE - got it!
 * 
 * npc squads
 * 
 * smart battle movement
 * 
 * wandering
 * 
 * traits
 * 
 * dialogue
 * 
 * encampments
 * 
 * more
 * */

def_m_spd = 1;
m_spd = def_m_spd;

max_hp = 100;
hp = max_hp;

infected = false;

pathfind_delay_max_def = 20;
pathfind_delay_max = pathfind_delay_max_def;
pathfind_delay = 0;

dr = 640; //detection range
mdr = 100; //medium detection range
cdr = 32; //close detection range

show_average_zombies = false;

//weapon variables

pointer_x = x;
pointer_y = y;

b_end_x = x;
b_end_y = y;

show_pointer_pos = false;

line_x = 0;
line_y = 0;

draw_aim_line = false;

draw_bullet = false;
draw_sho_bullets = false;

def_aim_speed = irandom_range(1, 5);

weapon = irandom_range(1, 3); //0 = no weapon, 1 = revolver, 2 = shotgun, 3 = rifle, 4 = melee

accuracy = random_range(1, 3); // the lower this is, the more accurate they are

rev_shoot_delay_max = 30;
rev_shoot_delay_min = 5;
rev_shoot_delay = 0;

rev_accuracy = 30;

rev_max_total_bullets = infinity;
rev_max_bullets = 6;

rev_total_bullets = rev_max_total_bullets;
rev_bullets_left = rev_max_bullets;

rev_can_shoot = true;
rev_damage = 100;
rev_reload_delay_left = 0;
rev_reloading = false;
rev_max_reload_time = 10;
rev_reload_time_left = rev_max_reload_time;

sho_max_total_bullets = infinity;
sho_max_bullets = 8;

sho_total_bullets = sho_max_total_bullets;
sho_bullets_left = sho_max_bullets;

sho_can_shoot = true;
pellet_points = [];
max_pellets = 8;
pellets_shot = 0;
sho_shoot_delay_max = 100;
sho_shoot_delay_min = 60;
sho_shoot_delay = 0;
sho_reloading = false;
sho_max_reload_time = 15;
sho_reload_time_left = sho_max_reload_time;
sho_damage = 75; //(per pellet)
sho_reload_delay_left = 0;
sho_max_pen = 3;

rif_max_total_mags = 3;
rif_max_bullets = 30;

rif_accuracy = 20;

fire_mode = 0; //0 = full auto, 1 = semi auto this is for rif only
rif_total_mags = rif_max_total_mags;
rif_bullets = rif_max_bullets;

rif_can_shoot = true;
rif_shoot_delay_max = 60;
rif_shoot_delay_min = 10;
rif_shoot_delay = 0;
rif_burst_delay = 0;
rif_damage = 50;
rif_reloading = false;
rif_max_reload_time = 90;
rif_reload_time_left = rif_max_reload_time;

max_burst = irandom_range(2, 6);
burst = 0;

gun_x_distance_from_player = 8;
gun_y_distance_from_player = 3;

gun_start_x = x + gun_x_distance_from_player;
gun_start_y = y + gun_y_distance_from_player;

function shoot(sound, damage, weapon_accuracy){ //wow this is my first time defining a function. I swear to god i've done this before in other languages but i fucking forgot they existed in gml
    draw_bullet = true;
    audio_play_sound_at(sound, x, y, 0, 160, 1000, 1, false, 0);
    if (instance_exists(obj_zombie_parent)) {
        obj_zombie_parent.target_x = x;
        obj_zombie_parent.target_y = y;
        obj_zombie_parent.chase_player = true;
        var max_interest = irandom_range(1200, 2000);
        obj_zombie_parent.interest = max_interest;
    }
    var bcx = x;
    var bcy = y;
    var d = weapon_accuracy;
    var end_x_min = pointer_x - (accuracy * point_distance(x, y, pointer_x, pointer_y) / d);
    var end_y_min = pointer_y - (accuracy * point_distance(x, y, pointer_x, pointer_y) / d);
    var end_x_max = pointer_x + (accuracy * point_distance(x, y, pointer_x, pointer_y) / d);
    var end_y_max = pointer_y + (accuracy * point_distance(x, y, pointer_x, pointer_y) / d);
    b_end_x = irandom_range(end_x_min, end_x_max);
    b_end_y = irandom_range(end_y_min, end_y_max);
    var bdir = point_direction(x, y, b_end_x, b_end_y);
    var bsx = lengthdir_x(1, bdir);
    var bsy = lengthdir_y(1, bdir);
    var bmax_dist = point_distance(x, y, b_end_x, b_end_y);
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
        if (instance_exists(obj_zombie_parent)) {
            if (position_meeting(bcx, bcy, obj_zombie_parent)) {
                var bzombie = noone;
                bzombie = instance_nearest(bcx, bcy, obj_zombie_parent);
                if (bzombie != noone) {
                    var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
                    deal_damage(damage, sound_to_play, bzombie, bzombie.x, bzombie.y);
                }
                break;
            };
        }
        var found_human = noone;
        
        with (obj_human_parent) {
            if (id != other.id && position_meeting(bcx, bcy, id)) {
                found_human = id;
                break;
            }
        }
        
        if (found_human != noone) {
            var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
            deal_damage(damage, sound_to_play, found_human, found_human.x, found_human.y);
            break;
        }
    }
    line_x = bcx;
    line_y = bcy;
}

function run_away(xx, yy, sd) {
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
function push_away(target, push_speed) {
    with (target){
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

push_delay = 0;
push_delay_max = 5;

target_door = noone;

squad = [];