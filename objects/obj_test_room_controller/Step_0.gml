if room != TestRoom and in_room = true in_room = false;

if room = TestRoom and in_room = false{
    if !instance_exists(obj_player){
        instance_create_depth(256, 160, 0, obj_player);
    }

    if !instance_exists(obj_pathfinding){
        instance_create_depth(0, 0, 0, obj_pathfinding);
    }

    if !instance_exists(obj_weapon_improved){
        instance_create_depth(0, 0, 0, obj_weapon_improved);
    }
    
    if !instance_exists(obj_retard){
        instance_create_depth(0, 0, 0, obj_retard);
    }
    in_room = true;
}