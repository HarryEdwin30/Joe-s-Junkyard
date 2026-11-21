if (boards and hp < ahp) {
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

if hp <= 0 and !broken {
    image_index = 2;
    var index1 = array_get_index(global.closed_obstacles, id);
    var index2 = array_get_index(global.breakable_obstacles, id);
    array_delete(global.closed_obstacles, index1, 1);
    array_delete(global.breakable_obstacles, index2, 1);
    var sound_to_play = choose(windowbreak1, windowbreak2, windowbreak3);
    audio_play_sound_at(sound_to_play, x, y, 0, 160, 480, 1, false, 0);
    broken = true;
}