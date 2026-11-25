if (enabled) {
    var zone = instance_position(obj_player.x, obj_player.y, obj_spawn_area);
    if (zone != noone) {
        if (global.zombies < max_zombies) {
        	if (spawn_delay > 0) {
            	spawn_delay -= 1;
            } else {
                var types = [obj_walker, obj_runner];
                if (zone.walkers <= 0) {
                    var index = array_get_index(types, obj_walker);
                	array_delete(types, index, 1);
                }
                if (zone.runners <= 0) {
                	var index = array_get_index(types, obj_runner);
                	array_delete(types, index, 1);
                }
                var length = array_length(types);
                if (length > 0) {
                    var type = types[irandom_range(0, length - 1)];
                    spawn_zombie(type);
                    switch (type) {
                    	case obj_walker:
                            zone.walkers -= 1;
                            break;
                        case obj_runner:
                            zone.runners -= 1;
                            break;
                    }
                }
                spawn_delay = zone.spawn_delay;
            }
        }
    }
}