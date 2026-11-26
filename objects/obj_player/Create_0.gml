key = "player";

def_m_spd = 1;
m_spd = 1;
is_running = false;
def_max_hp = 100;
max_hp = def_max_hp;
can_run = true;
def_max_stamina = 100;
max_stamina = def_max_stamina;
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
        hungry: false
    }
}

infected = data.infected;
hp = data.hp;
hungry = data.hungry;
last_hp = hp;

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