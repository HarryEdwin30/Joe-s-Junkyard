draw_self();
if (instance_exists(obj_zombie_parent)) {
    var zombie = instance_nearest(x, y, obj_zombie_parent);
    if (point_distance(x, y, zombie.x, zombie.y) < dr) {
        var lax = 0; //large average x
        var lay = 0;
        var lzombies = 0;
        
        var sax = 0;
        var say = 0;
        var szombies = 0;
        
        with (obj_zombie_parent) {
            if (point_distance(x, y, other.x, other.y) < other.dr) {
                if (point_distance(x, y, other.x, other.y) < other.cdr) {
                    sax += x;
                    say += y;
                    szombies += 1;
                }
                lax += x;
                lay += y;
                lzombies += 1;
            }
        }
        
        lax /= lzombies;
        lay /= lzombies;
        
        if (szombies > 0) {
            sax /= szombies;
            say /= szombies;
        }
        
        var size = 16;
        var lax2 = lax + size;
        var lay2 = lay + size;
        var sax2 = sax + size;
        var say2 = say + size;
        
        show_debug_message("x: " + string(lax) + "y: " + string(lay));
        
        draw_rectangle_colour(lax, lay, lax2, lay2, c_red, c_red, c_red, c_red, false);
        draw_rectangle_colour(sax, say, sax2, say2, c_aqua, c_aqua, c_aqua, c_aqua, false);
    }
}