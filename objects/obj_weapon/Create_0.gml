weapon_type = 0; //0 = no weapon, 1 = revolver, 2 = shotgun, 3 = rifle, 4 = melee
draw_a_bullet = false;
draw_sho_bullets = false;
draw_sho_bullets_delay_max = 1;
draw_sho_bullets_delay = draw_sho_bullets_delay_max;
draw_a_bullet_delay_max = 1;
draw_a_bullet_delay = draw_a_bullet_delay_max;

gun_x_distance_from_player = 8;
gun_y_distance_from_player = 3;

gun_start_x = obj_player.x + gun_x_distance_from_player;
gun_start_y = obj_player.y + gun_y_distance_from_player;

ham_charging = false;
ham_delay_max = 60;
ham_delay = 0;
ham_charge_up_sound_delay_max = 5;
ham_charge_up_sound_delay = 0;
ham_can_play_max_charge_sound = true;
ham_target_in_range = false;
ham_draw_target = false;
ham_target = undefined;
ham_charge_speed = 0.2;
ham_max_charge = 10;
ham_charge = 0;
ham_base_damage = 10;
ham_base_stamina_usage = 5;

rev_unlocked = true;
rev_can_shoot = true;
rev_max_total_bullets = 30;
rev_total_bullets = rev_max_total_bullets;
rev_damage = 100;
rev_reload_delay_left = 0;
rev_max_bullets = 6;
rev_bullets_left = rev_max_bullets;
rev_reloading = false;
rev_max_reload_time = 10;
rev_reload_time_left = rev_max_reload_time;

sho_unlocked = true;
sho_can_shoot = true;
pellet_points = [];
max_pellets = 8;
pellets_shot = 0;
sho_max_total_bullets = 24;
sho_total_bullets_left = sho_max_total_bullets;
sho_max_bullets = 8;
sho_bullets_left = sho_max_bullets;
sho_shoot_delay_max = 60;
sho_shoot_delay = 0;
sho_reloading = false;
sho_max_reload_time = 15;
sho_reload_time_left = sho_max_reload_time;
sho_damage = 15; //(per pellet)
sho_reload_delay_left = 0;

rif_unlocked = true;
rif_can_shoot = true;
fire_mode = 0; //0 = full auto, 1 = semi auto
rif_max_total_mags = 3;
rif_total_mags = rif_max_total_mags;
rif_shoot_delay_max = 5;
rif_shoot_delay = 0;
rif_damage = 50;
rif_max_bullets = 30;
rif_bullets_left = rif_max_bullets;
rif_reloading = false;
rif_max_reload_time = 90;
rif_reload_time_left = rif_max_reload_time;