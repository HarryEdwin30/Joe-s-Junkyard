sprite_index = choose(spr_walker1, spr_walker2);

max_m_spd = 0.75;
m_spd = max_m_spd;
hp = irandom_range(50, 100);
last_hp = hp;
damage_delay_max = 60;
damage_delay = damage_delay_max;
max_stun = 65;
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
    wanger1,
    wanger2,
    wanger3,
    wanger4,
    wanger5
];

wander_sounds = [
    wwander1,
    wwander2,
    wwander3,
    wwander4,
    wwander5
];

attack_sounds = [
    wattack1,
    wattack2,
    wattack3,
    wattack4,
    wattack5
];

hurt_sounds = [
    whurt1,
    whurt2,
    whurt3,
    whurt4,
    whurt5
]

pixels_min = 5;
pixels_max = 40;

max_pixels_to_travel = irandom_range(pixels_min, pixels_max);
pixels_traveled = max_pixels_to_travel;

last_x = x;
last_y = y;