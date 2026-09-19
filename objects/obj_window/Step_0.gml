if (boards) {
    if (!given_board_hp) {
    	ahp = hp
	    hp += 50;
        given_board_hp = true;
    }
    if (hp <= ahp) {
        reset = false;
        var sound_to_play = doorbreak1;
        audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
    	boards = false;
        given_board_hp = false;
        if (bhptgb > 0) {
        	bhptgb = 0;
        }
    }
}

if hp <= 0{
    broken = true;
}
if (broken) {
	if played_broken_sound = false{
        if (sound_delay > 0) {
    	   sound_delay -= 1;
        }
        else {
        	var sound_to_play = windowbreak1 //choose(windowbreak1, windowbreak2, windowbreak3);
            audio_play_sound_at(sound_to_play, x, y, 0, 160, 480, 1, false, 0);
            played_broken_sound = true;
        }
    }
}
	
switch (boards) {
    case false:
        if (broken) {
        	open = true;
            image_index = 2;
            if (array_contains(global.opaque_obstacles, id)) {
        	    var index3 = array_get_index(global.opaque_obstacles, id);
                array_delete(global.opaque_obstacles, index3, 1);
            }
        }
        else{
            if (array_contains(global.opaque_obstacles, id)) {
        	    var index3 = array_get_index(global.opaque_obstacles, id);
                array_delete(global.opaque_obstacles, index3, 1);
            }
            image_index = 0;
        }
        break;
    case true:
        if (!array_contains(global.opaque_obstacles, id)) { 
            array_push(global.opaque_obstacles, id);
        }
        open = false;
        if (broken) {
            image_index = 3;
        }
        else{
            image_index = 1;
        }
        break;
}
if global.player_alive = true and obj_player.can_move = true{
    var dfw = point_distance(obj_player.x, obj_player.y, cx, cy);
    
    if keyboard_check(vk_space) and dfw <= 32 and reset and !obj_player.being_attacked{
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
                reset = false;
                boards = true;
                audio_play_sound_at(boardbuilt1, x, y, 0, 160, 320, 1, false, 0);
                board_delay = board_delay_max;
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
    if !keyboard_check(vk_space) and !reset{
        reset = true;
    }
}
if !open{
    if (!added_to_array) {
    	array_push(global.closed_obstacles, id);
        array_push(global.breakable_obstacles, id);
        added_to_array = true;
    }
}
else{
    if (added_to_array) {
    	var index1 = array_get_index(global.closed_obstacles, id);
        var index2 = array_get_index(global.breakable_obstacles, id);
        array_delete(global.closed_obstacles, index1, 1);
        array_delete(global.breakable_obstacles, index2, 1);
        added_to_array = false;
    }
}