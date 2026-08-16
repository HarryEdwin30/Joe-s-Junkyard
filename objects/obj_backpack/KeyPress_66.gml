if draw_backpack_ui = false{
    obj_player.can_move = false;
    draw_backpack_ui = true;
}
else{
    obj_player.can_move = true;
    draw_backpack_ui = false;
    
    instance_destroy(obj_transition_ammo);
    has_created_obj = false;
}