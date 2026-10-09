if hp <= 0 and !broken{
    broken = true;
    open = true;
    image_index = 2;
    var sound_to_play = doorbreak1;
    audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
    var index1 = array_get_index(global.closed_obstacles, id);
    var index2 = array_get_index(global.breakable_obstacles, id);
    var index3 = array_get_index(global.opaque_obstacles, id);
    array_delete(global.closed_obstacles, index1, 1);
    array_delete(global.breakable_obstacles, index2, 1);
    array_delete(global.opaque_obstacles, index3, 1);
    audio_play_sound(dooropen, 0, false);
}
if keyboard_check_pressed(vk_space){
    if instance_exists(obj_player) and obj_player.can_move and !broken{
        var dfd = point_distance(obj_player.x, obj_player.y, cx, cy);
        
        if dfd <= 32 and !obj_player.being_attacked{
            if open = false{
                open = true;
                image_index = 1;
                var index1 = array_get_index(global.closed_obstacles, id);
                var index2 = array_get_index(global.breakable_obstacles, id);
                var index3 = array_get_index(global.opaque_obstacles, id);
                array_delete(global.closed_obstacles, index1, 1);
                array_delete(global.breakable_obstacles, index2, 1);
                array_delete(global.opaque_obstacles, index3, 1);
                audio_play_sound(dooropen, 0, false);
            }
            else{
                open = false;
                image_index = 0;
                array_push(global.closed_obstacles, id);
                array_push(global.breakable_obstacles, id);
                array_push(global.opaque_obstacles, id);
                audio_play_sound(doorclose, 0, false);
            }
        }
    }
}

//reworked this door for 300 fps gain that you will never notice