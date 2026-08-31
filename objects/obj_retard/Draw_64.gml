if show_dev_stats = false exit;
    
draw_set_colour(c_white);
draw_text(0, 0, "FPS: " + string(fps_real));
draw_text(0, 20, "Zombies: " + string(instance_number(obj_zombie_parent)));
if instance_exists(obj_ai_director){
    if obj_ai_director.enabled = true draw_text(0, 40, "AI Director enabled");
        else draw_text(0, 40, "AI Director disabled");
}