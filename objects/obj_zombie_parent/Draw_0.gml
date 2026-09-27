draw_self();
if instance_exists(obj_player) and !global.see_all{
    if !collision_line(x, y, obj_player.x, obj_player.y, global.opaque_obstacles, false, undefined){
        image_alpha = 1;
    }
    else if image_alpha > 0 image_alpha -= 0.01;
}
else {
    image_alpha = 1;
}