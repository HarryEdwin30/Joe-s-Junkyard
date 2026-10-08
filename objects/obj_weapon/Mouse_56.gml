if !instance_exists(obj_player) or !obj_player.can_move or global.pause exit;

rif_shoot_delay = 0;

if weapon_type = 4{
    if ham_target_in_range = true and obj_player.being_attacked = false and ham_delay <= 0{
        ham_delay = ham_delay_max;
        
        var stamina_to_lose = (ham_base_stamina_usage * ham_charge) * 1;
        if stamina_to_lose > obj_player.stamina{
            stamina_to_lose = obj_player.stamina;
        }
        obj_player.stamina -= stamina_to_lose;
        audio_play_sound(ham_hit, 0, false);
        var sound_to_play = undefined;
        if (ham_target.object_index == obj_zombie_parent || object_is_ancestor(ham_target.object_index, obj_zombie_parent)) {
        	sound_to_play = choose(bulletimpact1, bulletimpact2, bulletimpact3, bulletimpact4);
            var damage_to_deal = (stamina_to_lose) * 3;
            deal_damage(damage_to_deal, sound_to_play, ham_target);
        }
        if (ham_target.object_index == obj_window || object_is_ancestor(ham_target.object_index, obj_window)) {
            if (!ham_target.broken) {
                ham_target.broken = true;
                var wsound_to_play = choose(windowbreak1, windowbreak2, windowbreak3);
                audio_play_sound_at(wsound_to_play, ham_target.x, ham_target.y, 0, 160, 480, 1, false, 0);
            	ham_target.broken = true;
                if (ham_target.boards) {
                	ham_target.image_index = 3;
                }
                else {
                	ham_target.image_index = 2;
                    var index1 = array_get_index(global.closed_obstacles, ham_target);
                    var index2 = array_get_index(global.breakable_obstacles, ham_target);
                    array_delete(global.closed_obstacles, index1, 1);
                    array_delete(global.breakable_obstacles, index2, 1);
                }
            }
        }
    }
    ham_target_in_range = false;
    ham_draw_target = false;
    ham_charge = 0;
    ham_can_play_max_charge_sound = true;
}