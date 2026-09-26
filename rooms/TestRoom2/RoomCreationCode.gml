global.closed_obstacles = [];
global.opaque_obstacles = [];
global.breakable_obstacles = [];

if (instance_exists(obj_door)) {
    with (obj_door) {
        if (added_to_array) {
            added_to_array = false;
        }
    }
}
if (instance_exists(obj_window)) {
    with (obj_window) {
        if (added_to_array) {
            added_to_array = false;
        }
    }
}

tilemap = layer_tilemap_get_id("obstacles");
array_push(global.closed_obstacles, tilemap);
array_push(global.opaque_obstacles, tilemap);