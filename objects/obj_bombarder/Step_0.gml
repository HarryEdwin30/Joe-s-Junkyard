if (keyboard_check(vk_control)) {
	if (keyboard_check_pressed(ord("1"))) {
    	toggle("light");
    } else if (keyboard_check_pressed(ord("2"))) {
    	toggle("medium");
    } else if (keyboard_check_pressed(ord("3"))) {
    	toggle("heavy");
    } else if (keyboard_check_pressed(ord("4"))) {
    	toggle();
    }
}

if (enabled) {
	if (delay > 0) {
    	delay -= 1;
    } else {
        drop_bomb();
    	switch (type) {
        	case "light":
                max_delay = irandom_range(120, 240);
                break;
            case "medium":
                max_delay = irandom_range(60, 120);
                break;
            case "heavy":
                max_delay = irandom_range(30, 60);
                break;
        }
        delay = max_delay;
    }
}