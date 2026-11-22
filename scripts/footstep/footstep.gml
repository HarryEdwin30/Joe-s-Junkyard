function footstep(){
    var map = layer_tilemap_get_id("backgroundlayer");
    var mapdata = tilemap_get_at_pixel(map, x, y);
    var type = tile_get_index(mapdata);
    var sound = undefined;
    switch (type) {
        case floors.grass:
            sound = choose(fs_grass1, fs_grass2, fs_grass3);
            break;
        case floors.dirt:
            sound = choose(fs_dirt1, fs_dirt2, fs_dirt3);
            break;
        
        case floors.wood:
            sound = choose(fs_wood1, fs_wood2, fs_wood3);
            break;
        case floors.darkwood:
            sound = choose(fs_wood1, fs_wood2, fs_wood3);
            break;
        
        case floors.carpet:
            sound = choose(fs_carpet1, fs_carpet2, fs_carpet3);
            break;
        case floors.bluecarpet:
            sound = choose(fs_carpet1, fs_carpet2, fs_carpet3);
            break;
        case floors.purpcarpet:
            sound = choose(fs_carpet1, fs_carpet2, fs_carpet3);
            break;
        
        case floors.stone:
            sound = choose(fs_stone1, fs_stone2, fs_stone3);
            break;
        case floors.road:
            sound = choose(fs_stone1, fs_stone2, fs_stone3);
            break;
        case floors.roadwhite:
            sound = choose(fs_stone1, fs_stone2, fs_stone3);
            break;
        
        case floors.tile:
            sound = choose(fs_tile1, fs_tile2, fs_tile3);
            break;
    }
    if (sound != undefined) {
    	audio_play_sound(sound, 0, false);
    }
}