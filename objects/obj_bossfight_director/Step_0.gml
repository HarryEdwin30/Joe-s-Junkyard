if (bf_1) {
    var loc = choose("t", "b", "l", "r");
    spawn_zombie(obj_walker, loc);
}
else if (keyboard_check_pressed(ord("J"))) {
	bf_1 = true;
}