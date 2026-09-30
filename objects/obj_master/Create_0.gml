//randomise the game

randomise();

//global data struct

global.data = {};

if (file_exists("data.json")) {
    var _buffer = buffer_load("data.json");
    global.data = json_parse(buffer_read(_buffer, buffer_string));
    buffer_delete(_buffer);
} else {
    global.data = {};
}

//saving variables

global.save_key = "save";
global.save_game = false;

//game started

global.game_started = false;

//screen

window_enable_borderless_fullscreen(true);
window_set_fullscreen(true);
fullscreen = true;

//set the audio model spatial audio

audio_falloff_set_model(audio_falloff_linear_distance_clamped);

//set custom sprite

window_set_cursor(cr_none);
cursor_sprite = spr_crosshair;

//menu variable for checking if a menu is open

global.menu = false; //FIXME rework the menu thing (ykwita) so that it's not so fucking annoying

//obstacle arrays

global.closed_obstacles = [];
global.breakable_obstacles = [];
global.opaque_obstacles = [];

//dev control variables

dev_controls_enabled = true;

show_stats = true;

global.godmode = true;
global.invisible = true;
global.zombie_omniscience = false;
global.see_all = false;

spawn_mode = "hold";
types = [obj_walker, obj_runner]
max_types = array_length(types) - 1;
type_to_spawn = 0;

gc_handled = false;

set_player_save_spawnpoint = false;

//pausing

global.pause = false;
draw_pause_menu = false;

//max distance from containers

global.mdfc = 64;