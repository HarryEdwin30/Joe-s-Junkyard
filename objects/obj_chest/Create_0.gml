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

chest_empty = true;

drop_rapid_delay_max = 15;
drop_rapid_delay = drop_rapid_delay_max;
time_between_rapid_drops_max = 3;
time_between_rapid_drops = time_between_rapid_drops_max;

image_alpha = 0;

key = "chest_" + string(room) + "_" + string(x) + "_" + string(y);

if (struct_exists(global.data, key)) {
	data = global.data[$ key];
    
    exists = data.exists;
    bs = data.bs;
    scrap = data.scrap;
    rev_ammo = data.rev_ammo;
    sho_ammo = data.sho_ammo;
    rif_ammo = data.rif_ammo;
    zev_cakes = data.zev_cakes;
}
else {
    exists = choose(true, false);
    
    var chest_type = 1; //1 = common, 2 = uncommon, 3 = rare
    var uncommon_chance = 25;
    var rare_chance = 5;
    var chance = random(100);
    if chance < uncommon_chance{
        if chance < rare_chance{
            chest_type = 3;
        }
        else{
            chest_type = 2
        }
    }
    
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
        zev_cakes = irandom_range(0, 1);
    }
    if chest_type = 3{
        bs = irandom_range(0, 6);
        scrap = irandom_range(0, 5);
        rev_ammo = irandom_range(0, 24);
        sho_ammo = irandom_range(0, 16);
        rif_ammo = irandom_range(0, 2);
        zev_cakes = irandom_range(0, 3);
    }
    data = {
        exists: exists,
        bs: bs,
        scrap: scrap,
        rev_ammo: rev_ammo,
        sho_ammo: sho_ammo,
        rif_ammo: rif_ammo,
        zev_cakes: zev_cakes
    }
}

rx1 = 100;
ry1 = 140;
rx2 = 530;
ry2 = 340;

draw_outline = false;

var xo = (sprite_width / 2 + sprite_get_xoffset(image_index)) * image_xscale;
var yo = (sprite_height / 2 + sprite_get_yoffset(image_index)) * image_yscale;

var dist = point_distance(0, 0, xo, yo);
var dir = point_direction(0, 0, xo, yo) + image_angle; //we don't need to add the image angle because the sprite is a square, but i'm gonna do it anyway (:

cx = lengthdir_x(dist, dir) + x;
cy = lengthdir_y(dist, dir) + y;