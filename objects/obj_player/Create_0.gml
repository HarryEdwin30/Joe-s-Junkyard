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
        hp: max_hp
        
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