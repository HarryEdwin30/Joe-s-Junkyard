sprite_index = spr_runner1;

max_m_spd = 2;
m_spd = max_m_spd;
hp = irandom_range(25, 75);
last_hp = hp;
damage_delay_max = 60;
damage_delay = damage_delay_max;
max_stun = 40;
stunned = 0;
chase_player = false;
wandering = false;
wander_delay = irandom_range(300, 600);
can_see_player = false;
interest = 0;
pathfinding_delay = 0;
collision_delay = 0;
touching_obs = false;
break_delay = 0;
breaking_something = false;
image_alpha = 0;

push_out_of_obstacle = false;

notice_sound = false;

emitter = audio_emitter_create();
audio_emitter_falloff(emitter, 150, 300, 1);

sound_delay_max = 20;
sound_delay = 0;

last_sound = noone;

current_sound = noone;

anger_sounds = [
    ranger1,
    ranger2,
    ranger3,
    ranger4,
    ranger5
];

wander_sounds = [
    rwander1,
    rwander2,
    rwander3,
    rwander4,
    rwander5
];

attack_sounds = [
    rattack1,
    rattack2,
    rattack3,
    rattack4,
    rattack5
];

hurt_sounds = [
    rhurt1,
    rhurt2,
    rhurt3,
    rhurt4,
    rhurt5
];

pixels_min = 10;
pixels_max = 25;

max_pixels_to_travel = irandom_range(pixels_min, pixels_max);
pixels_traveled = max_pixels_to_travel;

last_x = x;
last_y = y;