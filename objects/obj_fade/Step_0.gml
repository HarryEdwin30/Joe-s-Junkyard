if instance_exists(obj_player){
    run_fade = false;
    death_i_alpha = 0;
    fade_in = true;
}
else if (!run_fade) {
	death_i_alpha = 0;
    run_fade = true;
}

if death_i_alpha = 1{
    fade_in = false;
    instance_destroy(obj_weapon);
    room_goto(DeathRoom);
    global.game_started = false;
}

if run_fade = true{
    if fade_in = true{
        death_i_alpha += death_fade_speed;
    }
    else{
        death_i_alpha -= death_fade_speed;
    }
    
}