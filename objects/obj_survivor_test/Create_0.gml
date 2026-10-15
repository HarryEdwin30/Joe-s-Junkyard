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

b_end_x = x;
b_end_y = y;

show_pointer_pos = false;

line_x = 0;
line_y = 0;

draw_aim_line = false;

draw_bullet = false;
draw_sho_bullets = false;

def_aim_speed = 1;

weapon = 2; //0 = no weapon, 1 = revolver, 2 = shotgun, 3 = rifle, 4 = melee

accuracy = 2; // the lower this is, the more accurate they are

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

sho_max_total_bullets = infinity;
sho_max_bullets = 8;

sho_total_bullets = sho_max_total_bullets;
sho_bullets_left = sho_max_bullets;

sho_can_shoot = true;
pellet_points = [];
max_pellets = 8;
pellets_shot = 0;
sho_shoot_delay_max = 100;
sho_shoot_delay_min = 60;
sho_shoot_delay = 0;
sho_reloading = false;
sho_max_reload_time = 15;
sho_reload_time_left = sho_max_reload_time;
sho_damage = 75; //(per pellet)
sho_reload_delay_left = 0;
sho_max_pen = 3;

gun_x_distance_from_player = 8;
gun_y_distance_from_player = 3;

gun_start_x = x + gun_x_distance_from_player;
gun_start_y = y + gun_y_distance_from_player;