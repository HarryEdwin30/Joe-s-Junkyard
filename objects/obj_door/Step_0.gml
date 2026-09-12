if hp <= 0{
    broken = true;
    if played_broken_sound = false{
        var sound_to_play = doorbreak1;
        audio_play_sound_at(sound_to_play, x, y, 0, 160, 320, 1, false, 0);
        played_broken_sound = true;
    }
}
if global.player_alive = true{
    var _center_x_offset = (sprite_get_width(sprite_index) / 2 - sprite_xoffset) * image_xscale;
    var _center_y_offset = (sprite_get_height(sprite_index) / 2 - sprite_yoffset) * image_yscale;
    
    var _dist = point_distance(0, 0, _center_x_offset, _center_y_offset);
    var _dir = point_direction(0, 0, _center_x_offset, _center_y_offset) + image_angle;
    
    var cx = x + lengthdir_x(_dist, _dir);
    var cy = y + lengthdir_y(_dist, _dir);
    
    var dfd = point_distance(obj_player.x, obj_player.y, cx, cy);
    
    if keyboard_check_pressed(ord("E")) and dfd <= 32{
        if open = false{
            open = true;
            audio_play_sound(dooropen, 0, false);
        }
        else{
            open = false;
            audio_play_sound(doorclose, 0, false);
        }
    }
}
if open = false{
    image_index = 0;
}
else{
    image_index = 1;
}
if broken = true{
    open = true;
    image_index = 2;
}