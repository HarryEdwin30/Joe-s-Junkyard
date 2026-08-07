if global.player_alive = false exit;
    
if global.being_attacked = true exit;
    
if weapon_type = 3 and rif_bullets_left <= 0{
    audio_play_sound(emptygun, 0, false);
}
    
if weapon_type = 1 and rev_bullets_left <= 0{
    audio_play_sound(emptygun, 0, false);
}

if weapon_type = 1 and rev_can_shoot = true{
    draw_a_bullet = true;
    var tilemap = layer_tilemap_get_id("obstacles");
    var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
    if !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y,  tilemap, true, undefined){
        var zombies_in_sights = ds_list_create();
        var target = obj_zombie_parent;
        if collision_line_list(obj_player.x, obj_player.y, mouse_x, mouse_y, target, true, true, zombies_in_sights, true){
            var zombie_to_shoot = ds_list_find_value(zombies_in_sights, 0);
            deal_damage(rev_damage, sound_to_play, zombie_to_shoot);
        }
        if position_meeting(mouse_x, mouse_y, obj_player){
            obj_player.infected = false;
            deal_damage(1000, sound_to_play, obj_player);
        }
    }
    
    rev_bullets_left -= 1;
    audio_play_sound(rev_gunshot1, 0, false);
    
    if instance_exists(obj_zombie_parent){
        obj_zombie_parent.target_x = obj_player.x;
        obj_zombie_parent.target_y = obj_player.y;
        obj_zombie_parent.search_zone_w = [obj_zombie_parent.target_x - 60, obj_zombie_parent.target_x + 60];
        obj_zombie_parent.search_zone_h = [obj_zombie_parent.target_y - 60, obj_zombie_parent.target_y + 60];
        obj_zombie_parent.chase_player = true;
        obj_zombie_parent.interest = obj_zombie_parent.max_interest;
    }
}

if weapon_type = 3 and rif_can_shoot = true and fire_mode = 1{
    rif_shoot_delay = rif_shoot_delay_max;
    draw_a_bullet = true;
    var tilemap = layer_tilemap_get_id("obstacles");
    var sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
    if !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y,  tilemap, true, undefined){
        var zombies_in_sights = ds_list_create();
        var target = obj_zombie_parent;
        if collision_line_list(obj_player.x, obj_player.y, mouse_x, mouse_y, target, true, true, zombies_in_sights, true){
            var zombie_to_shoot = ds_list_find_value(zombies_in_sights, 0);
            deal_damage(rif_damage, sound_to_play, zombie_to_shoot);
        }
        if position_meeting(mouse_x, mouse_y, obj_player){
            obj_player.infected = false;
            deal_damage(1000, sound_to_play, obj_player);
        }
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