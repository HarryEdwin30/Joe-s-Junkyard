global.last_room = room;
global.player_alive = true;
global.zoomed_in = false;
global.draw_esc_menu_gui = false;
global.godmode = true;
global.invisible = true;
global.zombie_omniscience = false;
global.see_all = false;
spawn_mode = "hold";

if file_exists("gamesave.ini"){
    ini_open("gamesave.ini")
    obj_player.x = ini_read_real("Player", "X", 0);
    obj_player.y = ini_read_real("Player", "Y", 0);
    ini_close();
}

show_dev_stats = true;
draw_mm_options = false;

global.closed_obstacles = [];
global.breakable_obstacles = [];
global.opaque_obstacles = [];

last_room = room;
tilemap = layer_tilemap_get_id("obstacles");
array_push(global.closed_obstacles, tilemap);
array_push(global.opaque_obstacles, tilemap);