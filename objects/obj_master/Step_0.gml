if keyboard_check_pressed(vk_backspace) game_end();
    
//fullscreen control

if keyboard_check_pressed(vk_f4){
    if (fullscreen) {
    	window_set_fullscreen(false);
        fullscreen = false;
    }
    else {
    	window_set_fullscreen(true);
        fullscreen = true;
    }
}

//show dev stats control

if (keyboard_check_pressed(vk_f1)) {
	if (show_stats) {
    	show_stats = false;
    }
    else {
    	show_stats = true;
    }
}

if (global.game_started) {
    
    if (keyboard_check_pressed(ord("L"))) {
    	glog("GRANT LIKES CUTE HOT SOVIET FEMBOYS", 5, undefined);
    }
    
    //pause menu
    
    if (keyboard_check_pressed(vk_escape)) {
    	if (draw_pause_menu = false) {
        	if (!global.menu) {
            	global.menu = true;
                draw_pause_menu = true;
                global.pause = true;
            }
        }
        else {
            global.menu = false;
        	draw_pause_menu = false;
            global.pause = false;
        }
    }
    
    //load player coords if save file exists
    
    if (struct_exists(global.data, global.save_key) and instance_exists(obj_player) and !set_player_save_spawnpoint) {
        var data = global.data[$ global.save_key];
        obj_player.x = data.player_x;
        obj_player.y = data.player_y;
        set_player_save_spawnpoint = true;
    }
    
    //if the game is being saved
    
    if (global.save_game) {
        var _string = json_stringify(global.data);
        var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
        buffer_write(_buffer, buffer_string, _string);
        buffer_save(_buffer, "data.json");
        buffer_delete(_buffer);
        show_debug_message("game saved");
        audio_play_sound(bp_select, 0, false);
        global.save_game = false;
    }
    
    //dev controls
    
    if (dev_controls_enabled) {
        
        //hotkeys
        
        if (keyboard_check(vk_control)) {
            if keyboard_check_pressed(ord("C")){
                obj_weapon.rev_unlocked = true;
                obj_weapon.sho_unlocked = true;
                obj_weapon.rif_unlocked = true;
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
        	if keyboard_check_pressed(ord("O")){
                if !global.zombie_omniscience{
                    global.zombie_omniscience = true;
                }
                else {
                	global.zombie_omniscience = false;
                }
            }
            if keyboard_check_pressed(ord("G")){
                if global.godmode{
                    global.godmode = false;
                }
                else{
                    global.godmode = true;
                    obj_player.stamina = obj_player.max_stamina;
                    obj_player.hp = obj_player.max_hp;
                }
            }
            if keyboard_check_pressed(ord("I")){
                if global.invisible{
                    global.invisible = false;
                }
                else{
                    global.invisible = true;
                }
            }
            if keyboard_check_pressed(ord("K")){
                if (instance_exists(obj_zombie_parent)) {
                	instance_destroy(obj_zombie_parent);
                }
            }
            if keyboard_check_pressed(ord("L")){
                if (global.see_all) {
                	global.see_all = false;
                }
                else {
                	global.see_all = true;
                }
            }
            
            //switch spawn type and mode
            
            if (keyboard_check_pressed(vk_right)) {
            	if (type_to_spawn < max_types) {
                	type_to_spawn += 1;
                }
            }
            if (keyboard_check_pressed(vk_left)) {
            	if (type_to_spawn > 0) {
                	type_to_spawn -= 1;
                }
            }
            if keyboard_check_pressed(ord("M")){
                switch (spawn_mode) {
                	case "hold":
                        spawn_mode = "press"
                        break;
                    case "press":
                        spawn_mode = "hold"
                        break;
                }
            }
        }
        
        //spawning
        
        var ml = layer_get_id("mainlayer");
        switch (spawn_mode) {
	        case "hold":
                if keyboard_check(ord("F")){
                    instance_create_layer(mouse_x, mouse_y, ml, types[type_to_spawn]);
                }
                break;
            case "press":
                if keyboard_check_pressed(ord("F")){
                    instance_create_layer(mouse_x, mouse_y, ml, types[type_to_spawn]);
                }
                break;
        }
    }
    
    //zoom
    
    if (mouse_wheel_down()) {
    	if instance_exists(obj_player) and obj_player.can_move{
            var cam = view_camera[0];
            camera_set_view_size(cam, 640, 480);
        }
    }
    if (mouse_wheel_up()) {
    	if instance_exists(obj_player) and obj_player.can_move{
            var cam = view_camera[0];
            camera_set_view_size(cam, 320, 240);
        }
    }
    
    if (instance_exists(obj_gun_chest)) {
	    if (!gc_handled) {
            var gc_spawned = 0;
            
        	var chests = [];
            with (obj_gun_chest) {
            	array_push(chests, id);
            }
            
            var guns = [1, 2, 3]; //1 is rev, 2 is sho, and 3 is rif
            
            while (gc_spawned < 3) {
            	var i1 = irandom(array_length(chests) - 1);
                var i2 = irandom(array_length(guns) - 1);
                
                chests[i1].iexist = true;
                chests[i1].gun = guns[i2];
                
                array_delete(chests, i1, 1);
                array_delete(guns, i2, 1);
                
                gc_spawned += 1;
            }
            gc_handled = true;
        }
    }
}
else {
	if (gc_handled) {
    	gc_handled = false;
    }
}