if draw_backpack_ui = true{
    if has_created_obj = false{
        instance_create_depth(obj_x, obj_y, 0, obj_transition_ammo);
        has_created_obj = true;
    }
}
if position_meeting(mouse_x, mouse_y, obj_transition_ammo){
    obj_text_color = c_black;
}
else{
    obj_text_color = c_red;
}