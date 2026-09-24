if keyboard_check_pressed(vk_backspace) game_end();

fullscreen_delay -= 1;
    
if keyboard_check_pressed(vk_f4) and can_set_fullscreen = true and fullscreen_delay <= 0{
    fullscreen_delay = max_fullscreen_delay;
    can_set_fullscreen = false;
    window_set_fullscreen(true);
}
    
if keyboard_check_pressed(vk_f4) and can_set_fullscreen = false and fullscreen_delay <= 0{
    fullscreen_delay = max_fullscreen_delay;
    can_set_fullscreen = true;
    window_set_fullscreen(false);
}

window_set_cursor(cr_none);

cursor_sprite = spr_crosshair;