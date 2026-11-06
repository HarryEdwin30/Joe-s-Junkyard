if (delay > 0) {
    delay -= 1;
} else {
    var sound = choose(bomb1, bomb2, bomb3);
    with (obj_human_parent) {
    	if (place_meeting(x, y, other)) {
        	hp -= other.damage;
        }
    }
    audio_stop_sound(sound_to_play);
    audio_play_sound_at(sound, x, y, 0, 160, 480, 1, false, 0);
    instance_destroy();
}