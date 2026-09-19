if hp <= 0{
    broken = true;
    if played_broken_sound = false{
        var sound_to_play = doorbreak1;
        audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
        played_broken_sound = true;
    }
}
if global.player_alive and obj_player.can_move and !broken{
    var dfd = point_distance(obj_player.x, obj_player.y, cx, cy);
    
    if keyboard_check_pressed(vk_space) and dfd <= 32{
        if open = false{
            open = true;
            audio_play_sound(dooropen, 0, false);
        }
        else{
            open = false;
            audio_play_sound(doorclose, 0, false);
        }
    }
}
if !open{
    image_index = 0;
    if (!added_to_array) {
    	array_push(global.closed_obstacles, id);
        array_push(global.breakable_obstacles, id);
        added_to_array = true;
    }
}
else{
    image_index = 1;
    if (added_to_array) {
    	var index1 = array_get_index(global.closed_obstacles, id);
        var index2 = array_get_index(global.breakable_obstacles, id);
        array_delete(global.closed_obstacles, index1, 1);
        array_delete(global.breakable_obstacles, index2, 1);
        added_to_array = false;
    }
}
if broken = true{
    open = true;
    image_index = 2;
}