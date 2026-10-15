def_m_spd = 2;
m_spd = def_m_spd;

pathfind_delay_max_def = 20;
pathfind_delay_max = pathfind_delay_max_def;
pathfind_delay = 0;

dr = 400; //detection range
mdr = 100; //medium detection range
cdr = 32; //close detection range

show_average_zombies = false;

//weapon variables

pointer_x = x;
pointer_y = y;

show_pointer_pos = false;

line_x = 0;
line_y = 0;

draw_aim_line = false;

draw_bullet = false;

def_aim_speed = 1;

weapon = 1; //0 = no weapon, 1 = revolver, 2 = shotgun, 3 = rifle, 4 = melee

rev_shoot_delay_max = 30;
rev_shoot_delay_min = 5;
rev_shoot_delay = 0;

rev_max_total_bullets = infinity;
rev_max_bullets = 6;

rev_total_bullets = rev_max_total_bullets;
rev_bullets_left = rev_max_bullets;

rev_can_shoot = true;
rev_damage = 100;
rev_reload_delay_left = 0;
rev_reloading = false;
rev_max_reload_time = 10;
rev_reload_time_left = rev_max_reload_time;

gun_x_distance_from_player = 8;
gun_y_distance_from_player = 3;

gun_start_x = x + gun_x_distance_from_player;
gun_start_y = y + gun_y_distance_from_player;