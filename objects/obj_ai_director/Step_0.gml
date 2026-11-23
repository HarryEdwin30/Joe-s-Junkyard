if (enabled) {
    if (global.zombies < max_zombies) {
    	if (spawn_delay > 0) {
        	spawn_delay -= 1;
        } else {
            spawn_zombie(choose(obj_walker, obj_runner));
            spawn_delay = max_spawn_delay;
        }
    }
}