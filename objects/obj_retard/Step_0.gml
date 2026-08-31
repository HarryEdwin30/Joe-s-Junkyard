var cam = view_camera[0];
if global.player_alive = false{
    camera_set_view_size(cam, 640, 480);
    camera_set_view_target(cam, obj_death_marker);
}
surface_resize(application_surface, camera_get_view_width(cam), camera_get_view_height(cam));

if keyboard_check_pressed(ord("C")){
    audio_play_sound(resupply, 0, false);
    if obj_weapon.rev_total_bullets < obj_weapon.rev_max_total_bullets or obj_weapon.rev_bullets_left < obj_weapon.rev_max_bullets{
        var rev_total_bullets_to_add = obj_weapon.rev_max_total_bullets - obj_weapon.rev_total_bullets;
        var rev_bullets_to_add = obj_weapon.rev_max_bullets - obj_weapon.rev_bullets_left;
        
        obj_weapon.rev_total_bullets += rev_total_bullets_to_add;
        obj_weapon.rev_bullets_left += rev_bullets_to_add;
    }
    if obj_weapon.sho_total_bullets_left < obj_weapon.sho_max_total_bullets or obj_weapon.sho_bullets_left < obj_weapon.sho_max_bullets{
        var sho_total_bullets_to_add = obj_weapon.sho_max_total_bullets - obj_weapon.sho_total_bullets_left;
        var sho_bullets_to_add = obj_weapon.sho_max_bullets - obj_weapon.sho_bullets_left;
        
        obj_weapon.sho_total_bullets_left += sho_total_bullets_to_add;
        obj_weapon.sho_bullets_left += sho_bullets_to_add;
    }
    if obj_weapon.rif_total_mags < obj_weapon.rif_max_total_mags or obj_weapon.rif_bullets_left < obj_weapon.rif_max_bullets{
        var rif_total_mags_to_add = obj_weapon.rif_max_total_mags - obj_weapon.rif_total_mags;
        
        obj_weapon.rif_total_mags += rif_total_mags_to_add;
        obj_weapon.rif_bullets_left = obj_weapon.rif_max_bullets;
    }
}


global.infected = instance_number(obj_zombie_parent);

if !instance_exists(obj_player) and global.player_alive = true{
    global.player_alive = false;
}

if keyboard_check_pressed(ord("F")){
    instance_create_depth(mouse_x, mouse_y, 0, obj_walker);
}
if keyboard_check_pressed(ord("G")){
    instance_create_depth(mouse_x, mouse_y, 0, obj_runner);
}

if global.zoomed_in = true{
    camera_set_view_size(cam, 320, 240);
}
else camera_set_view_size(cam, 640, 480);
    
if global.draw_esc_menu_gui = true{
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    var b_x1 = 160;
    var b_x2 = b_x1 + 128;
    
    var mmb_y1 = 180;
    var mmb_y2 = mmb_y1 + 32;
    
    if mouse_gui_x >= b_x1 && mouse_gui_x <= b_x2{
        if mouse_gui_y >= mmb_y1 and mouse_gui_y <= mmb_y2{
            if mouse_check_button_pressed(mb_left){
                move_to_menu();
            }
        }
    }
}