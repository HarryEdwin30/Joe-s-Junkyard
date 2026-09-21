if (keyboard_check_pressed(ord("E")) and !opened) {
	switch (gun) {
    	case 1:
            obj_weapon.rev_unlocked = true;
            audio_play_sound(revolverdraw, 0, false);
            break;
        case 2:
            obj_weapon.sho_unlocked = true;
            audio_play_sound(sho_draw, 0, false);
            break;
        case 3:
            obj_weapon.rif_unlocked = true;
            audio_play_sound(rifledraw, 0, false);
            break;
    }
    audio_play_sound(yay, 0, false);
    opened = true;
}