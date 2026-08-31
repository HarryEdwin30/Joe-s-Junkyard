if (variable_global_exists("map_grid") && global.map_grid != noone) {
    mp_grid_destroy(global.map_grid);
    global.map_grid = noone;
}