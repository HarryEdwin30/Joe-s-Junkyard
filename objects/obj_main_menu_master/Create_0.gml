global.game_started = false;
window_enable_borderless_fullscreen(true);
window_set_fullscreen(false);
can_set_fullscreen = true;
max_fullscreen_delay = 15;
fullscreen_delay = 0;
audio_falloff_set_model(audio_falloff_linear_distance_clamped);