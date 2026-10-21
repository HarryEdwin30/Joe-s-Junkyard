function door_open(door) {
    if door.open = false{
        door.open = true;
        door.image_index = 1;
        var index1 = array_get_index(global.closed_obstacles, door.id);
        var index2 = array_get_index(global.breakable_obstacles, door.id);
        var index3 = array_get_index(global.opaque_obstacles, door.id);
        array_delete(global.closed_obstacles, index1, 1);
        array_delete(global.breakable_obstacles, index2, 1);
        array_delete(global.opaque_obstacles, index3, 1);
        audio_play_sound(dooropen, 0, false);
    }
    else{
        door.open = false;
        door.image_index = 0;
        array_push(global.closed_obstacles, door.id);
        array_push(global.breakable_obstacles, door.id);
        array_push(global.opaque_obstacles, door.id);
        audio_play_sound(doorclose, 0, false);
    }
}