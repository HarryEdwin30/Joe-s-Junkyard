if room != last_room{
    show_debug_message("yass")
    if (global.map_grid != noone) {
        mp_grid_destroy(global.map_grid);
        global.map_grid = noone;
    }
    
    last_room = room;
    
    var cs = 16;
    var mw = room_width / cs;
    var mh = room_height / cs;
    
    global.map_grid = mp_grid_create(0, 0, mw, mh, cs, cs);
    
    var tilemaps = [];
    
    if layer_exists("obstacles"){
        array_push(tilemaps, layer_tilemap_get_id("obstacles"));
    }
    
    for (var yy = 0; yy < mh; yy++) {
        for (var xx = 0; xx < mw; xx++) {
            var _has_tile = false;
            
            for (var i = 0; i < array_length(tilemaps); i++) {
                var tile_data = tilemap_get(tilemaps[i], xx, yy);
                if (tile_data != 0) {
                    _has_tile = true;
                    break;
                }
            }
            
            if (_has_tile) {
                mp_grid_add_cell(global.map_grid, xx, yy);
            }
        }
    }
}