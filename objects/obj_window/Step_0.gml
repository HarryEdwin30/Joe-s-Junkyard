if (boards and hp <= ahp) {
    if (broken) {
        image_index = 2;
        var index3 = array_get_index(global.opaque_obstacles, id);
        array_delete(global.opaque_obstacles, index3, 1);
        var index1 = array_get_index(global.closed_obstacles, id);
        var index2 = array_get_index(global.breakable_obstacles, id);
        array_delete(global.closed_obstacles, index1, 1);
        array_delete(global.breakable_obstacles, index2, 1);
    }
    else{
        var index3 = array_get_index(global.opaque_obstacles, id);
        array_delete(global.opaque_obstacles, index3, 1);
        image_index = 0;
    }
    reset = false;
    var sound_to_play = doorbreak1;
    audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
    boards = false;
    given_board_hp = false;
    if (bhptgb > 0) {
        bhptgb = 0;
    }
}

if hp <= 0 and !broken{
    image_index = 2;
    var index1 = array_get_index(global.closed_obstacles, id);
    var index2 = array_get_index(global.breakable_obstacles, id);
    array_delete(global.closed_obstacles, index1, 1);
    array_delete(global.breakable_obstacles, index2, 1);
    var sound_to_play = choose(windowbreak1, windowbreak2, windowbreak3);
    audio_play_sound_at(sound_to_play, x, y, 0, 160, 480, 1, false, 0);
    broken = true;
}

if keyboard_check(vk_space){
    if instance_exists(obj_player) and obj_player.can_move = true{
        var dfw = point_distance(obj_player.x, obj_player.y, cx, cy);
        
        if dfw <= 32 and reset and !obj_player.being_attacked{
            var sd = 10; //sound delay
            if (boards) {
            	hp -= 1;
                bhptgb += 1;
                if (hp % sd == 0) {
                    audio_play_sound(ham_charge_up, 0, false);
                }
            }
            else{
                if (board_delay > 0) {
                	board_delay -= 1;
                    if (board_delay % sd == 0) {
                        audio_play_sound(ham_charge_up, 0, false);
                    }
                }
                else{
                    array_push(global.opaque_obstacles, id);
                    if (broken) {
                        image_index = 3;
                    }
                    else{
                        image_index = 1;
                    }
                    reset = false;
                    boards = true;
                    audio_play_sound_at(boardbuilt1, x, y, 0, 160, 320, 1, false, 0);
                    board_delay = board_delay_max;
                    ahp = hp;
                    hp += 50;
                    array_push(global.closed_obstacles, id);
                    array_push(global.breakable_obstacles, id);
                }
            }
        }
        else{
            if (board_delay < board_delay_max) {
        	   board_delay = board_delay_max;
            }
            if (boards) {
                if (bhptgb > 0) {
                	hp += bhptgb;
                    bhptgb = 0;
                }
            }
        }
    }
}
else if (!reset) {
	reset = true;
}