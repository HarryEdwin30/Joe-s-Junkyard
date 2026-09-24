global.last_room = room;
global.player_alive = true;
global.zoomed_in = false;
global.draw_esc_menu_gui = false;
global.godmode = true;
global.invisible = true;
global.zombie_omniscience = false;
global.see_all = false;
global.menu = false; //FIXME rework the menu thing (ykwita) so that it's not so fucking annoying

gc_handled = false;

spawn_mode = "hold";

show_dev_stats = true;
draw_mm_options = false;

global.closed_obstacles = [];
global.breakable_obstacles = [];
global.opaque_obstacles = [];

last_room = room;
tilemap = layer_tilemap_get_id("obstacles");
array_push(global.closed_obstacles, tilemap);
array_push(global.opaque_obstacles, tilemap);

var cam = view_camera[0];
surface_resize(application_surface, camera_get_view_width(cam), camera_get_view_height(cam));