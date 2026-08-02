if global.player_alive = false exit;
    
if global.being_attacked = true exit;

if global.bullets_left >= bullets and global.reloading = false{
    audio_play_sound(emptygun, 0, false)
}

if global.can_shoot = true{
    if position_meeting(mouse_x, mouse_y, obj_damage_system){
        if position_meeting(mouse_x, mouse_y, obj_player) obj_player.infected = false;
        sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
        deal_damage(100, sound_to_play, obj_damage_system);
    }
    audio_play_sound(gunshot1, 0, false);
    global.bullets_left += 1;
    
    if instance_exists(obj_zombie_parent){
        obj_zombie_parent.target_x = obj_player.x;
        obj_zombie_parent.target_y = obj_player.y;
        obj_zombie_parent.search_zone_w = [obj_zombie_parent.target_x - 60, obj_zombie_parent.target_x + 60];
        obj_zombie_parent.search_zone_h = [obj_zombie_parent.target_y - 60, obj_zombie_parent.target_y + 60];
        obj_zombie_parent.chase_player = true;
        obj_zombie_parent.interest = obj_zombie_parent.max_interest;
        show_debug_message("Hey, I heard that!");
    }
}
