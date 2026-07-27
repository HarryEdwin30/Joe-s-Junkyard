draw_set_font(fancyfont);
draw_set_colour(c_red);

draw_sprite(spr_ui_box, 0, 0, 0);
    
if global.bullets_left < bullets draw_text(5, 5, "Weapon is loaded.")
    else{
        if global.reloading = true draw_text(5, 5, "Reloading...")
            else draw_text(5, 5, "Weapon is out of bullets!")
    }