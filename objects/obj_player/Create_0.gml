key = "player";

def_m_spd = 1;
m_spd = 1;
is_running = false;
max_hp = 100;
can_run = true;
max_stamina = 100;
stamina = max_stamina;
can_move = true;
push_cooldown_max = 60;
push_cooldown = 0;
being_attacked = false;

tilemap = layer_tilemap_get_id("obstacles");

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
}
else {
	data = {
        infected: false,
        hp: max_hp,
    }
}

infected = data.infected;
hp = data.hp;

squad = [];
squad_max_size = 3;

heal_delay_max = 240;
heal_delay = heal_delay_max;

heal_amount = 2;

step_delay_def = 30;
step_delay_max = step_delay_def;
step_delay = step_delay_max;

max_pixels_to_travel = 50;
pixels_traveled = max_pixels_to_travel;

last_x = x;
last_y = y;

footstep = function() {
    var map = layer_tilemap_get_id("backgroundlayer");
    var mapdata = tilemap_get_at_pixel(map, x, y);
    var type = tile_get_index(mapdata);
    var sound = undefined;
    switch (type) {
        case 1: //grass
            sound = choose(fs_grass1, fs_grass2, fs_grass3);
            break;
        case 2: //purple placeholder?
            break;
        case 3: //dirt
            sound = choose(fs_dirt1, fs_dirt2, fs_dirt3);
            break;
        case 4: //wood
            sound = choose(fs_wood1, fs_wood2, fs_wood3);
            break;
        case 5: //carpet
            break;
        case 6: //stone
            sound = choose(fs_stone1, fs_stone2, fs_stone3);
            break;
    }
    audio_play_sound(sound, 0, false);
}