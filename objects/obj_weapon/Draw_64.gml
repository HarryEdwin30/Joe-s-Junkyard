if global.player_alive = false exit;

draw_set_font(fancyfont);
draw_set_colour(c_red);

var weapon_string = undefined;

if weapon_type = 0 weapon_string = "Weapon: None";

if weapon_type = 1 weapon_string = "Weapon: Revolver";
    
if weapon_type = 3 weapon_string = "Weapon: Rifle";

draw_text(5, 385, weapon_string);

if weapon_type = 0 exit;
    
var ammo_string = undefined;
    
if weapon_type = 1{
    ammo_string = string(rev_bullets_left) + "/" + string(rev_total_bullets);
}

if weapon_type = 3{
    if rif_reloading = true{
        ammo_string = ".../" + string(rif_total_mags);
    }
    else ammo_string = string(rif_bullets_left) + "/" + string(rif_total_mags);
}

if weapon_type != 0 or weapon_type != 4{
    draw_text(5, 405, "Ammo: " + ammo_string);
}

if weapon_type = 3{
    var mode_string = undefined;
    if fire_mode = 0 mode_string = "Full Auto"
        else mode_string = "Semi Auto"
            
    draw_text(5, 425, "Mode: " + mode_string);
}