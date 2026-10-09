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