if hp <= 0{
    global.being_attacked = false;
    global.survivors_left -= 1;
    audio_play_sound(death, 0, false);
    if infected = true{
        instance_create_depth(x, y, 0, obj_walker);
    }
    instance_destroy()
}
