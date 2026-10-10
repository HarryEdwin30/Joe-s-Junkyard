if (!iexist) {
    if (obj_master.gc_handled) {
    	instance_destroy();
    }
}

if instance_exists(obj_player){
    var cam = view_camera[0];
    
    var camx1 = camera_get_view_x(cam);
    var camy1 = camera_get_view_y(cam);
    var camx2 = camera_get_view_x(cam) + camera_get_view_width(cam);
    var camy2 = camera_get_view_y(cam) + camera_get_view_height(cam);
    
    if (point_in_rectangle(x, y, camx1, camy1, camx2, camy2)) {
    	if !collision_line(x, y, obj_player.x, obj_player.y, global.opaque_obstacles, false, undefined) or global.see_all{
            image_alpha = 1;
        }
        else if image_alpha > 0{
            image_alpha -= 0.01;
        }
    }
    else if (image_alpha != 0){
    	image_alpha = 0;
    }
}
if (position_meeting(mouse_x, mouse_y, id)) {
    if (!global.menu and !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, global.closed_obstacles, true, true) and point_distance(obj_player.x, obj_player.y, cx, cy) < global.mdfc and !opened) {
    	draw_outline = true;
        if (mouse_check_button_pressed(mb_right)) {
        	switch (gun) {
        	   case 1:
                    obj_weapon.rev_unlocked = true;
                    audio_play_sound(revolverdraw, 0, false);
                    glog("You found a revolver!", 3, undefined);
                    break;
                case 2:
                    obj_weapon.sho_unlocked = true;
                    audio_play_sound(sho_draw, 0, false);
                    glog("You found a shotgun!", 3, undefined);
                    break;
                case 3:
                    obj_weapon.rif_unlocked = true;
                    audio_play_sound(rifledraw, 0, false);
                    glog("You found a rifle!", 3, undefined);
                    break;
            }
            audio_play_sound(yay, 0, false);
            opened = true;
        }
    }
}
else if (draw_outline) {
	draw_outline = false;
}

switch (gun) {
	case 1:
        if (obj_weapon.rev_unlocked) {
        	opened = true;
        }
        break;
    case 2:
        if (obj_weapon.sho_unlocked) {
        	opened = true;
        }
        break;
    case 3:
        if (obj_weapon.rif_unlocked) {
        	opened = true;
        }
        break;
}

if (!opened) {
	image_index = 0;
}
else {
	image_index = 1;
}