if global.player_alive = false exit;
    
if obj_player.can_move = false exit;
    
if global.draw_esc_menu_gui = true{
    exit;
}
    
if global.being_attacked = true exit;
    
rif_shoot_delay -= 1;

if weapon_type = 4 and obj_player.stamina > 0{
    if ham_charge < ham_max_charge{
        ham_charge += ham_charge_speed;
    }
    
    if ham_charge_up_sound_delay <= 0 and ham_charge < ham_max_charge{
        audio_play_sound(ham_charge_up, 0, false);
        ham_charge_up_sound_delay = ham_charge_up_sound_delay_max
    }
    ham_charge_up_sound_delay -= 1;
    
    var targets_list = ds_list_create();
    var circle_size = 20;
    if collision_circle(mouse_x, mouse_y, circle_size, obj_zombie_parent, true, true){
        collision_circle_list(mouse_x, mouse_y, circle_size, obj_zombie_parent, true, true, targets_list, true);
        ham_target = ds_list_find_value(targets_list, 0);
        var ham_target_distance = point_distance(obj_player.x, obj_player.y, ham_target.x, ham_target.y);
        var ham_target_distance_max = 50
        var tilemap = layer_tilemap_get_id("obstacles");
        var targets = [tilemap];
        if instance_exists(obj_door){
            with (obj_door) {
                if (open == false) {
                    array_push(targets, id);
                }
            }
        }
        if ham_target_distance <= ham_target_distance_max and !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, targets, false, true){
            ham_target_in_range = true;
            ham_draw_target = true;
        }
        else{
            ham_target_in_range = false;
            ham_draw_target = false;
        }
    }
    else{
        ham_draw_target = false;
    }
}
    
if weapon_type = 3 and rif_can_shoot = true and rif_shoot_delay <= 0 and fire_mode = 0{
    rif_shoot_delay = rif_shoot_delay_max;
    draw_a_bullet = true;
    var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
    var tilemap = layer_tilemap_get_id("obstacles");
    var targets = [tilemap, obj_zombie_parent];
    if instance_exists(obj_door){
        with (obj_door) {
        	if (open == false) {
                array_push(targets, id);
            }
        }
    }
    var start_x = obj_player.x;
    var start_y = obj_player.y;
    var checker_x = start_x;
    var checker_y = start_y;
    var point_x = mouse_x;
    var point_y = mouse_y;
    var dir = point_direction(start_x, start_y, point_x, point_y);
    var max_distance = point_distance(start_x, start_y, point_x, point_y);
    
    var step_x = lengthdir_x(1, dir);
    var step_y = lengthdir_y(1, dir);
    
    while (position_meeting(checker_x, checker_y, targets) == 0 and point_distance(start_x, start_y, checker_x, checker_y) < max_distance) {
    	checker_x += step_x;
        checker_y += step_y;
    }
    
    var end_x = checker_x;
    var end_y = checker_y;
    
    if position_meeting(end_x, end_y, obj_zombie_parent){
        var zombie_to_shoot = instance_nearest(end_x, end_y, obj_zombie_parent);
        deal_damage(rif_damage, sound_to_play, zombie_to_shoot);
    }
    if position_meeting(mouse_x, mouse_y, obj_player){
        obj_player.infected = false;
        deal_damage(1000, sound_to_play, obj_player);
    }
    
    rif_bullets_left -= 1;
    audio_play_sound(rif_gunshot1, 0, false);
    
    if instance_exists(obj_zombie_parent){
        obj_zombie_parent.target_x = obj_player.x;
        obj_zombie_parent.target_y = obj_player.y;
        obj_zombie_parent.search_zone_w = [obj_zombie_parent.target_x - 60, obj_zombie_parent.target_x + 60];
        obj_zombie_parent.search_zone_h = [obj_zombie_parent.target_y - 60, obj_zombie_parent.target_y + 60];
        obj_zombie_parent.chase_player = true;
        obj_zombie_parent.interest = obj_zombie_parent.max_interest;
    }
}