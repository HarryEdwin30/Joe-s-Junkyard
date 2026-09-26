if show_stats{
    draw_set_colour(c_white);
    draw_set_font(fancyfont);
    draw_text(0, 0, "press f1 to hide/open dev stats");
    draw_text(0, 20, "FPS: " + string(fps_real));
    if (global.game_started) {
        draw_text(0, 40, "Zombies: " + string(instance_number(obj_zombie_parent)));
        if instance_exists(obj_ai_director){
            if obj_ai_director.enabled = true draw_text(0, 60, "AI Director enabled   (f2)");
                else draw_text(0, 60, "AI Director disabled   (f2)");
        }
        else draw_text(0, 60, "AI Director disabled   (f2)");
        if global.godmode = true{
            draw_text(0, 80, "Godmode on   (ctrl + g)");
        }
        else draw_text(0, 80, "Godmode off   (ctrl + g)");
            
        if global.invisible = true{
            draw_text(0, 100, "Invisible on   (ctrl + i)");
        }
        else draw_text(0, 100, "Invisible off   (ctrl + i)");
            
        if (global.zombie_omniscience) {
        	draw_text(0, 120, "Omniscience on   (ctrl + o)");
        }
        else {
        	draw_text(0, 120, "Omniscience off   (ctrl + o)");
        }
        if (global.see_all) {
        	draw_text(0, 140, "See All on    (ctrl + l)");
        }
        else {
        	draw_text(0, 140, "See All off   (ctrl + l)");
        }
        draw_text(0, 160, "Spawn mode: " + string(spawn_mode) + "   (ctrl + m)");
        draw_text(0, 180, "Spawn type: " + string(types[type_to_spawn]) + "   (ctrl + arrow left/right)");
        draw_text(0, 200, "Kill all: (ctrl + k)");
        draw_text(0, 220, "Give all weapons and/or refill: (ctrl + c)");
    }
}