if (delay > 0) {
    delay -= 1;
} else {
    with (obj_human_parent) {
    	if (place_meeting(x, y, other)) {
        	hp -= other.damage;
        }
    }
    instance_destroy();
}