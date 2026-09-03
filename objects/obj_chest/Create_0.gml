draw_gui = false;

obj_x = 390;
obj_y = 148;

draw_take_options = false;

bs_tamount = 0;
scrap_tamount = 0;
rev_tamount = 0;
sho_tamount = 0;
rif_tamount = 0;
zc_tamount = 0;

drop_rapid_delay_max = 15;
drop_rapid_delay = drop_rapid_delay_max;
time_between_rapid_drops_max = 3;
time_between_rapid_drops = time_between_rapid_drops_max;

randomise();
var chest_type = 1; //1 = common, 2 = uncommon, 3 = rare
var uncommon_chance = 40;
var rare_chance = 10;
var chance = random(100);
if chance < uncommon_chance{
    if chance < rare_chance{
        chest_type = 3;
    }
    else{
        chest_type = 2
    }
}
show_debug_message(chest_type);

if chest_type = 1{
    bs = irandom_range(0, 2);
    scrap = 0;
    rev_ammo = irandom_range(0, 6);
    sho_ammo = irandom_range(0, 4);
    rif_ammo = 0;
    zev_cakes = 0;
}
if chest_type = 2{
    bs = irandom_range(0, 4);
    scrap = irandom_range(0, 2);
    rev_ammo = irandom_range(0, 12);
    sho_ammo = irandom_range(0, 8);
    rif_ammo = irandom_range(0, 1);
    zev_cakes = 0;
}
if chest_type = 3{
    bs = irandom_range(0, 6);
    scrap = irandom_range(0, 5);
    rev_ammo = irandom_range(0, 24);
    sho_ammo = irandom_range(0, 16);
    rif_ammo = irandom_range(0, 2);
    zev_cakes = irandom_range(0, 1);
}
