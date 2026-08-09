if global.game_started = false exit;
    
if global.player_alive = true{
    run_fade = false;
    death_i_alpha = 0;
    fade_in = true;
}

if global.player_alive = false and run_fade = false{
    death_i_alpha = 0;
    run_fade = true;
}

if death_i_alpha = 1{
    fade_in = false;
    instance_destroy(obj_pathfinding);
    instance_destroy(obj_retard);
    instance_destroy(obj_weapon);
    room_goto(DeathRoom);
    
    if global.showacutezombiepic = true{
        var background = layer_background_get_id("Background");
        layer_background_sprite(background, zombieimg1);
        show_debug_message("should show image");
    }
}

if run_fade = true{
    if fade_in = true{
        death_i_alpha += death_fade_speed;
    }
    else{
        death_i_alpha -= death_fade_speed;
    }
    
}