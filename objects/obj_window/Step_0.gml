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
    }
}
if hp <= 0{
    broken = true;
}
if (broken) {
	if played_broken_sound = false{
        var sound_to_play = choose(windowbreak1, windowbreak2, windowbreak3);
        audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
        played_broken_sound = true;
    }
}
	
switch (boards) {
    case false:
        if (broken) {
        	open = true;
            image_index = 2;
        }
        else{
            image_index = 0;
        }
        break;
    case true:
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
    var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
    var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;
    
    var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
    var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;
    
    var cx = x + lengthdir_x(_dist, _dir);
    var cy = y + lengthdir_y(_dist, _dir);
    
    var dfw = point_distance(obj_player.x, obj_player.y, cx, cy);
    
    if keyboard_check(ord("E")) and dfw <= 32 and reset{
        var sd = 10; //sound delay
        if (boards) {
        	hp -= 1;
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
    else if (board_delay < board_delay_max) {
    	board_delay = board_delay_max;
    }
    if !keyboard_check(ord("E")) and !reset{
        reset = true;
    }
}
show_debug_message(hp);
show_debug_message(board_delay);