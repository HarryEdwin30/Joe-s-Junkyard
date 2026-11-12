php = get_percent(hp, max_hp, 100);

if (keyboard_check(vk_space)) { //this some nasty shit right here
    if (point_distance(cx, cy, obj_player.x, obj_player.y) < 64) {
        if (gain_delay > 0) {
            gain_delay -= 1;
        } else {
            gain_delay = gain_delay_max;
            if (hp < max_hp) {
                if (obj_supplies_depot.scrap > 0) {
                	if (point_distance(cx, cy, obj_player.x, obj_player.y) < global.mdfc) {
                    	if (hp < max_hp) {
                            if (hp + hp_gain > max_hp) {
                                obj_supplies_depot.scrap -= max_hp - hp;
                                hp = max_hp;
                            } else {
                                hp += hp_gain;
                                obj_supplies_depot.scrap -= scrap_cost;
                            }
                            audio_play_sound(boardbuilt1, 0, false);
                        }
                    }
                } else {
                    audio_play_sound(item_add_back, 0, false);
                }
            }
        }
    }
} else {
    gain_delay = gain_delay_max;
}

//don't code like me

if (hp > 25 and broken) {
    image_index = 0;
    array_push(global.closed_obstacles, id);
    array_push(global.breakable_obstacles, id);
    broken = false;
}

if (hp <= 0 and !broken) {
    image_index = 1;
    broken = true;
    var sound_to_play = doorbreak1;
    audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
    var index1 = array_get_index(global.closed_obstacles, id);
    var index2 = array_get_index(global.breakable_obstacles, id);
    array_delete(global.closed_obstacles, index1, 1);
    array_delete(global.breakable_obstacles, index2, 1);
    audio_play_sound(dooropen, 0, false);
}